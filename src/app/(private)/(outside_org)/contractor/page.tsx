import { createClient } from '@/utils/supabase/server';
import { columns } from './table-column';
import { CONTRACT } from '@/type/contract.types';
import { toast } from 'sonner';
import { ContractorTable } from './table';

export default async function ContractorPage() {
	const supabase = createClient();
	let tableData: CONTRACT[] = [];

	const {
		data: { user },
		error: authError
	} = await supabase.auth.getUser();
	if (authError || !user) toast.error(authError?.message || 'Unable to get user details');

	if (user) {
		const { data, error } = await supabase.from('contracts').select('id, profile_signed, org(name, id), entity(name, id, incorporation_country(country_code, name)), salary, start_date, employment_type, job_title, level, status').eq('profile', user?.id);
		if (error) toast.error(error.message);
		if (data) tableData = data as any;
	}

	return (
		<div className="grid gap-5">
			<h1 className="text-2xl font-medium">Contracts</h1>

			<ContractorTable data={tableData || []} columns={columns} />
		</div>
	);
}
