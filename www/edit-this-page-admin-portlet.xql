<?xml version="1.0"?>
<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="folder_existence">
<querytext>
	select etp__get_folder_id(:package_id)
</querytext>
</fullquery>

</queryset>
