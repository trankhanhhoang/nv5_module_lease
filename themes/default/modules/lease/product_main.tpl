<!-- BEGIN: main -->
<!-- BEGIN: view -->

<link href="/themes/softs/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">
<link href="/themes/softs/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css">	
<div class="page-breadcrumb d-none d-md-flex align-items-center mb-3">
	<div class="breadcrumb-title pr-3">{LANG.product}</div>
	<div class="pl-3">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb mb-0 p-0">
				<li class="breadcrumb-item"><a href="/"><i class='bx bx-home-alt'></i></a>
				</li>
				<li class="breadcrumb-item active" aria-current="page">{LANG.productlist}</li>
			</ol>
		</nav>
	</div>
	<div class="ml-auto">
		<div class="btn-group">
			<a type="button" class="btn btn-success" href="{PRODUCT_ADD}"><i class="lni lni-add-files mrg-r-5"></i>{LANG.product_add}</a> 
			<button type="button" class="btn btn-success bg-split-success dropdown-toggle dropdown-toggle-split" data-toggle="dropdown">	<span class="sr-only">{LANG.product_more}</span>
			</button>
			<div class="dropdown-menu dropdown-menu-right dropdown-menu-lg-left">
				<a class="dropdown-item" href="{PRODUCT_IMPORT}">{LANG.product_import}</a>
				<a class="dropdown-item" href="{PRODUCT_EXPORT}">{LANG.product_export}</a>
			</div>
		</div>
	</div>
</div>
<div class="card">
	<div class="card-body">
		<div class="card-title">
			<h4 class="mb-0">{LANG.productlist}</h4>
		</div>
		<hr/>	
		<form action="{NV_BASE_SITEURL}index.php?{NV_LANG_VARIABLE}={NV_LANG_DATA}&amp;{NV_NAME_VARIABLE}={MODULE_NAME}&amp;{NV_OP_VARIABLE}={OP}" method="post">
			
				<div class="dataTables_wrapper dt-bootstrap4">
					<table id="datatable" style="width: 100%;" class="table table-striped table-bordered dataTable">
						<thead class="thead-dark">
							<tr>
								<th class="text-center">STT</th>
								<th class="text-center">{LANG.func}</th> 
								<th>{LANG.productcode}</th>
								<th>{LANG.title_product_vi}</th>
								<th>{LANG.title_product_en}</th>
								<th>{LANG.fid}</th>
								<th>{LANG.area}</th>
								<th>{LANG.rent_status}</th>
								<th>{LANG.rent_status1}</th>
							</tr>
						</thead>
						<tbody>
							<!-- BEGIN: loop -->
							<tr>
								<td>{VIEW.weight}</td>
								<td class="text-center">
									<a class="large-icons-btn btn btn-primary" href="{VIEW.link_edit}#edit" data-toggle="tooltip" data-placement="top" title="{LANG.edit}" data-original-title="{LANG.edit}"><i class="lni lni-pencil"></i></a>&nbsp;&nbsp;
									<a class="large-icons-btn btn btn-danger" href="{VIEW.link_delete}" onclick="return confirm(nv_is_del_confirm[0]);" data-toggle="tooltip" data-placement="top" title="{LANG.delete}" data-original-title="{LANG.delete}"><i class="lni lni-trash"></i></a>
								</td>
								<td>(ID {VIEW.pid}):{VIEW.productcode}</td>
								<td> <a class="text-info" href ="{VIEW.link_view}" >{VIEW.title_vi}</a> </td>
								<td> <a class="text-info" href ="{VIEW.link_view}" >{VIEW.title_en}</a> </td>
								<td>{VIEW.floorname}</td>
								<td>{VIEW.area_format} {LANG.m2}</td>
								<td>{VIEW.rent_status}</td>
								<td class="text-center">
									<div class="custom-control custom-switch">
										<input class="custom-control-input" type="checkbox" name="active" id="change_status_{VIEW.pid}" value="{VIEW.pid}" {CHECK} onclick="nv_change_status({VIEW.pid});" /><label class="custom-control-label" for="change_status_{VIEW.pid}" data-toggle="tooltip" data-placement="top" title="Tắt/Mở" data-original-title="Tắt/Mở"></label>
									</div>
								</td>
							</tr>
							 <!-- END: loop -->
						</tbody>
						<tfoot>
							<tr>
								<th class="text-center">{LANG.weight}</th>
								<th class="text-center">{LANG.active}</th>
								<th>{LANG.productcode}</th>
								<th>{LANG.title_product_vi}</th>
								<th>{LANG.title_product_en}</th>
								<th>{LANG.fid}</th>
								<th>{LANG.area}</th>
								<th>{LANG.rent_status}</th>
								<th>{LANG.rent_status1}</th>
							</tr>
						</tfoot>
					</table>
				</div>
			
		</form>
	</div>
</div>	
<!-- END: view -->
<script type="text/javascript">
//<![CDATA[
    function nv_change_weight(id) {
        var nv_timer = nv_settimeout_disable('id_weight_' + id, 5000);
        var new_vid = $('#id_weight_' + id).val();
        $.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=product&nocache=' + new Date().getTime(), 'ajax_action=1&pid=' + id + '&new_vid=' + new_vid, function(res) {
            var r_split = res.split('_');
            if (r_split[0] != 'OK') {
                alert(nv_is_change_act_confirm[2]);
            }
            window.location.href = script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=product';
            return;
        });
        return;
    }
    function nv_change_status(id) {
        var new_status = $('#change_status_' + id).is(':checked') ? true : false;
        if (confirm(nv_is_change_act_confirm[0])) {
            var nv_timer = nv_settimeout_disable('change_status_' + id, 5000);
            $.post(script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=product&nocache=' + new Date().getTime(), 'change_status=1&pid='+id, function(res) {
                var r_split = res.split('_');
                if (r_split[0] != 'OK') {
                    alert(nv_is_change_act_confirm[2]);
                }
            });
        }
        else{
            $('#change_status_' + id).prop('checked', new_status ? false : true);
        }
        return;
    }
	function add_product() {
        window.location.href = '{PRODUCT_ADD}';
    }
 
//]]>
</script>
<!-- END: main -->