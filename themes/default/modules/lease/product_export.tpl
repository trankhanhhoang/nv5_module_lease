<!-- BEGIN: main -->
<!-- BEGIN: view -->
<div class="well">
<form action="{NV_BASE_SITEURL}index.php" method="get">
    <input type="hidden" name="{NV_LANG_VARIABLE}"  value="{NV_LANG_DATA}" />
    <input type="hidden" name="{NV_NAME_VARIABLE}"  value="{MODULE_NAME}" />
    <input type="hidden" name="{NV_OP_VARIABLE}"  value="{OP}" />
    <div class="row">
        <div class="col-xs-24 col-md-6">
            <div class="form-group">
                <input class="form-control" type="text" value="{Q}" name="q" maxlength="255" placeholder="{LANG.search_title}" />
            </div>
        </div>
        <div class="col-xs-12 col-md-3">
            <div class="form-group">
                <input class="btn btn-primary" type="submit" value="{LANG.search_submit}" />
            </div>
        </div>
    </div>
</form>
</div>
<form action="{NV_BASE_SITEURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" method="post">
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th class="w100">{LANG.update_date}</th>
                    <th>{LANG.fid}</th>
                    <th>{LANG.title}</th>
                    <th>{LANG.area}</th>
                    <th>{LANG.price_usd_min}</th>
                    <th>{LANG.price_usd_max}</th>
                    <th>{LANG.price_vnd_min}</th>
                    <th>{LANG.price_vnd_max}</th>
                    <th>{LANG.rent_status}</th>
                    <th>{LANG.image}</th>
                    <th>{LANG.note}</th>
                    <th>{LANG.active}</th>
                    <th>{LANG.adminid}</th>
                    <th>{LANG.crtd_date}</th>
                    <th>{LANG.userid_edit}</th>
                    <th class="w100 text-center">{LANG.active}</th>
                    <th class="w150">&nbsp;</th>
                </tr>
            </thead>
            <!-- BEGIN: generate_page -->
            <tfoot>
                <tr>
                    <td class="text-center" colspan="17">{NV_GENERATE_PAGE}</td>
                </tr>
            </tfoot>
            <!-- END: generate_page -->
            <tbody>
                <!-- BEGIN: loop -->
                <tr>
                    <td>
                        <select class="form-control" id="id_weight_{VIEW.pid}" onchange="nv_change_weight('{VIEW.pid}');">
                        <!-- BEGIN: update_date_loop -->
                            <option value="{WEIGHT.key}"{WEIGHT.selected}>{WEIGHT.title}</option>
                        <!-- END: update_date_loop -->
                    </select>
                </td>
                    <td> {VIEW.fid} </td>
                    <td> {VIEW.title} </td>
                    <td> {VIEW.area} </td>
                    <td> {VIEW.price_usd_min} </td>
                    <td> {VIEW.price_usd_max} </td>
                    <td> {VIEW.price_vnd_min} </td>
                    <td> {VIEW.price_vnd_max} </td>
                    <td> {VIEW.rent_status} </td>
                    <td> {VIEW.image} </td>
                    <td> {VIEW.note} </td>
                    <td> {VIEW.active} </td>
                    <td> {VIEW.adminid} </td>
                    <td> {VIEW.crtd_date} </td>
                    <td> {VIEW.userid_edit} </td>
                    <td class="text-center"><input type="checkbox" name="active" id="change_status_{VIEW.pid}" value="{VIEW.pid}" {CHECK} onclick="nv_change_status({VIEW.pid});" /></td>
                    <td class="text-center"><i class="fa fa-edit fa-lg">&nbsp;</i> <a href="{VIEW.link_edit}#edit">{LANG.edit}</a> - <em class="fa fa-trash-o fa-lg">&nbsp;</em> <a href="{VIEW.link_delete}" onclick="return confirm(nv_is_del_confirm[0]);">{LANG.delete}</a></td>
                </tr>
                <!-- END: loop -->
            </tbody>
        </table>
    </div>
</form>
<!-- END: view -->

<!-- END: main -->