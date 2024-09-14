import { createClient } from '@/utils/supabase/server';
import { EmployeeBandDialog } from './employee-band-form';
import { FormSection, FormSectionDescription, InputsContainer } from '../forms/form-section';

interface props {
	org: string;
}

export const EmployeeBand = async ({ org }: props) => {
	const supabase = createClient();

	const { data, error } = await supabase.from('employee_levels').select().eq('org', org);

	if (error) {
		return (
			<div className="grid w-full gap-2 border-t border-t-border py-10 text-center text-xs text-muted-foreground">
				<p>Unable to fetch employee band data</p>
				<p>{error.message}</p>
			</div>
		);
	}

	return (
		<FormSection id="levels">
			<FormSectionDescription>
				<h2 className="mb-1 font-normal">Employee Levels</h2>
				<p className="mt-3 text-xs font-thin text-muted-foreground sm:max-w-72">Creating employee levels makes it super easy to manage employees and their benefits. Set them once and connect them to employees once.</p>
			</FormSectionDescription>

			<InputsContainer>
				<div className="grid gap-8">
					{data.map(band => (
						<EmployeeBandDialog band={band} key={band.id} org={org} />
					))}

					<EmployeeBandDialog org={org} />
				</div>
			</InputsContainer>
		</FormSection>
	);
};
