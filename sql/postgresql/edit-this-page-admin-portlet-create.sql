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

--
-- Creates edit-this-page portlet
--
-- @author Stefan Wurdack (dotlrn@email.wuon.de)

create function inline_0 ()
returns integer as '
declare
  ds_id 	portal_datasources.datasource_id%TYPE;
begin
	ds_id = portal_datasource__new(
        		''edit-this-page_admin_portlet'',
        		''Displays edit-this-page''
			);

RAISE NOTICE '' created new ds'';

	perform portal_datasource__set_def_param (
	 	ds_id,
		''t'',
   		''t'',
    		''shadeable_p'',
		''f''
	);

RAISE NOTICE '' set shadeable'';
	perform portal_datasource__set_def_param (
 	  	ds_id,
  		''t'',
   	 	''t'',
    	 	''hideable_p'',
     	 	''f''
	);

RAISE NOTICE '' set hideable'';
	perform portal_datasource__set_def_param (
		ds_id,
		''t'',
 		''t'',
		''user_editable_p'',
 		''f''
	);

	perform portal_datasource__set_def_param (
 	       ds_id,
  	      ''t'',
	      ''t'',
	      ''shaded_p'',
	      ''f''
	);

	perform portal_datasource__set_def_param (
	        ds_id,
	        ''t'',
	        ''t'',
	        ''link_hideable_p'',
	        ''t''
	);

	perform portal_datasource__set_def_param (
		ds_id,
	        ''t'',
	        ''f'',
	        ''package_id'',
	        '' ''
	);


return 0;

end;' language 'plpgsql';



select inline_0();

drop function inline_0 ();

-- create the implementation
select acs_sc_impl__new (
        'portal_datasource',
        'edit-this-page_admin_portlet',
        'edit-this-page_admin_portlet'
);

-- add all the hooks
select acs_sc_impl_alias__new(
        'portal_datasource',
        'edit-this-page_admin_portlet',
        'GetMyName',
        'edit-this-page_admin_portlet::get_my_name',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'edit-this-page_admin_portlet',
        'GetPrettyName',
        'edit-this-page_admin_portlet::get_pretty_name',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'edit-this-page_admin_portlet',
        'Link',
        'edit-this-page_admin_portlet::link',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'edit-this-page_admin_portlet',
        'AddSelfToPage',
        'edit-this-page_admin_portlet::add_self_to_page',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'edit-this-page_admin_portlet',
        'Show',
        'edit-this-page_admin_portlet::show',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'edit-this-page_admin_portlet',
        'Edit',
        'edit-this-page_admin_portlet::edit',
        'TCL'
);

select acs_sc_impl_alias__new(
        'portal_datasource',
        'edit-this-page_admin_portlet',
        'RemoveSelfFromPage',
        'edit-this-page_admin_portlet::remove_self_from_page',
        'TCL'
);

-- Add the binding
select acs_sc_binding__new(
	'portal_datasource',
 	'edit-this-page_admin_portlet'
);
