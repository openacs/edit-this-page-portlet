<?xml version="1.0"?>
<queryset>
   <rdbms><type>postgresql</type><version>7.1</version></rdbms>

<fullquery name="select_etpp_object_id">
<querytext>
          select n.object_id
            from site_nodes n
           where n.parent_id = :etpp_site_node
             and n.name = :etpp_site_node_name
</querytext>
</fullquery>


<fullquery name="select_etpp_node_id">
<querytext>
          select n.node_id
            from site_nodes n
           where n.object_id = :etpp_package_id
</querytext>
</fullquery>

<fullquery name="select_etpp_folder_id">
<querytext>
          select f.folder_id
            from cr_folders f
           where f.package_id = :etpp_object
</querytext>
</fullquery>

<fullquery name="select_etpp_revisions">
<querytext>
          select i.name as url,
                 r.title as name,
                 i.tree_sortkey as sort_order,
                 i.live_revision as etpp_help_var
            from cr_items i, cr_revisions r
           where i.parent_id = :etpp_folder_id
             and r.revision_id = i.live_revision
        order by sort_order
</querytext>
</fullquery>

<fullquery name="select_etpp_extlinks">
<querytext>
          select e.url as url,
                 e.label as name,
                 i.tree_sortkey as sort_order,
                 i.item_id as etpp_help_var
            from cr_items i, cr_extlinks e
           where i.parent_id = :etpp_folder_id
             and e.extlink_id = i.item_id
        order by sort_order
</querytext>
</fullquery>

<fullquery name="select_etpp_subfolders">
<querytext>
          select i.name as url,
                 f.label as name,
                 i.tree_sortkey as sort_order,
                 i.item_id as etpp_help_var
            from cr_items i, cr_folders f
           where i.parent_id = :etpp_folder_id
             and f.folder_id = i.item_id
        order by sort_order
</querytext>
</fullquery>

</queryset>
