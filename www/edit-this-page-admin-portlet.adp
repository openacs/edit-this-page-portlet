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


<ul>
  <li><a href="@url@">#edit-this-page-portlet.admin_edit-this-page#</a></li>
  <if @url_fs@ eq 0>
    &nbsp;
  </if>
  <else>
    <li><a href="@url_fs@">#edit-this-page-portlet.fs_edit-this-page#</a></li>
  </else> 
</ul>