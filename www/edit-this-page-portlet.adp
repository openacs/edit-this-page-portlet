<%

    #
    #  Copyright (C) 2001, 2002 MIT
    #
    #  This file is part of dotLRN.
    #
    #  dotLRN is free software; you can redistribute it and/or modify it under the
    #  terms of the GNU General Public License as published by the Free Software
    #  Foundation; either version 2 of the License, or (at your option) any later
    #  version.
    #
    #  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
    #  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
    #  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
    #  details.
    #

%>


<if @shaded_p@ false>
  <if @etpp_result:rowcount@ gt 0>
    <%
      set new_package_id ""
      set old_package_id ""
    %>

    <multiple name="etpp_result">
      <% set new_package_id $etpp_folder_id %>
      <li> <a href="@etpp_result.url@">@etpp_result.name@</a> </li>
      <% set old_package_id $new_package_id %>
    </multiple>
  </if>
  <else>
    #edit-this-page-portlet.noentry_edit-this-page#
  </else>
</if>
<else>
  &nbsp;
</else>