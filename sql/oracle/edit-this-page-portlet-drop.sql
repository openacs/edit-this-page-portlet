--
--  Copyright (C) 2001, 2002 MIT
--
--  This file is part of dotLRN.
--
--  dotLRN is free software; you can redistribute it and/or modify it under the
--  terms of the GNU General Public License as published by the Free Software
--  Foundation; either version 2 of the License, or (at your option) any later
--  version.
--
--  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
--  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
--  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
--  details.
--

-- Drops edit-this-page portlet

-- @author Stefan Wurdack (dotlrn@email.wuon.de)

declare  
  ds_id portal_datasources.datasource_id%TYPE;
begin

  begin 
    select datasource_id into ds_id
      from portal_datasources
     where name = 'edit-this-page_portlet';
   exception when no_data_found then
     ds_id := null;
  end;

  if ds_id is not null then
    portal_datasource.del(ds_id);
  end if;

end;
/
show errors;

declare
	foo integer;
begin

	-- drop the hooks
	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'edit-this-page_portlet',
	       'GetMyName'
	);

	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'edit-this-page_portlet',
	       'GetPrettyName'
	);


	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'edit-this-page_portlet',
	       'Link'
	);

	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'edit-this-page_portlet',
	       'AddSelfToPage'
	);

	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'edit-this-page_portlet',
	       'Show'
	);

	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'edit-this-page_portlet',
	       'Edit'
	);

	foo := acs_sc_impl.delete_alias (
	       'portal_datasource',
	       'edit-this-page_portlet',
	       'RemoveSelfFromPage'
	);

	-- Drop the binding
	acs_sc_binding.del (
	    contract_name => 'portal_datasource',
	    impl_name => 'edit-this-page_portlet'
	);

	-- drop the impl
	foo := acs_sc_impl.del (
		'portal_datasource',
		'edit-this-page_portlet'
	);
end;
/
show errors

