import { Roles } from '@/components/open-role';
import { PageLoader } from '@/components/ui/page-loader';
import { Suspense } from 'react';

export default async function JobsPage(props: { params: { [key: string]: string }; searchParams: { [key: string]: string } }) {
	return (
		<Suspense fallback={<PageLoader />}>
			<Roles type={'job'} orgId={props.params.org_id} />
		</Suspense>
	);
}
