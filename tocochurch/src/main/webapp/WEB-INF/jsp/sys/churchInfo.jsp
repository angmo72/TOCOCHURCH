<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<link rel="stylesheet" href="/js/jqw/jqwidgets/styles/jqx.base.css" type="text/css" />
<!-- 	<script src="/js/jqw/scripts/jquery-1.12.4.min.js"></script> -->

    <script type="text/javascript" src="/js/jqw/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="/js/jqw/jqwidgets/jqxdata.js"></script> 
    <script type="text/javascript" src="/js/jqw/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="/js/jqw/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="/js/jqw/jqwidgets/jqxmenu.js"></script>
    <script type="text/javascript" src="/js/jqw/jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="/js/jqw/jqwidgets/jqxlistbox.js"></script>
    <script type="text/javascript" src="/js/jqw/jqwidgets/jqxdropdownlist.js"></script>
    <script type="text/javascript" src="/js/jqw/jqwidgets/jqxgrid.js"></script>
    <script type="text/javascript" src="/js/jqw/jqwidgets/jqxgrid.sort.js"></script> 
    <script type="text/javascript" src="/js/jqw/jqwidgets/jqxgrid.pager.js"></script> 
    <script type="text/javascript" src="/js/jqw/jqwidgets/jqxgrid.selection.js"></script> 
    <script type="text/javascript" src="/js/jqw/jqwidgets/jqxgrid.edit.js"></script> 
    <script type="text/javascript" src="/js/jqw/jqwidgets/jqxgrid.filter.js"></script> 
<script type="text/javascript">
$(document).ready(function () {

	var url = "";
// 	var url = "../sampledata/products.xml";
	// prepare the data
	var source =
	{
	    datatype: "xml",
	    datafields: [
	        { name: 'ProductName', type: 'string' },
	        { name: 'QuantityPerUnit', type: 'int' },
	        { name: 'UnitPrice', type: 'float' },
	        { name: 'UnitsInStock', type: 'float' },
	        { name: 'Discontinued', type: 'bool' }
	    ],
	    root: "Products",
	    record: "Product",
	    id: 'ProductID',
	    url: url
	};
	var cellsrenderer = function (row, columnfield, value, defaulthtml, columnproperties, rowdata) {
	    if (value < 20) {
	        return '<span style="margin: 4px; margin-top:8px; float: ' + columnproperties.cellsalign + '; color: #ff0000;">' + value + '</span>';
	    }
	    else {
	        return '<span style="margin: 4px; margin-top:8px; float: ' + columnproperties.cellsalign + '; color: #008000;">' + value + '</span>';
	    }
	}
	var dataAdapter = new $.jqx.dataAdapter(source, {
	    downloadComplete: function (data, status, xhr) { },
	    loadComplete: function (data) { },
	    loadError: function (xhr, status, error) { }
	});
	// initialize jqxGrid
	$("#grid").jqxGrid(
	{
	    width: '100%',
	    source: dataAdapter,                
	    pageable: true,
	    autoheight: true,
	    sortable: true,
	    altrows: true,
	    enabletooltips: true,
	    editable: true,
		filterable: true,
	    selectionmode: 'multiplecellsadvanced',
	    columns: [
	      { text: 'Product Name', columngroup: 'ProductDetails', datafield: 'ProductName', width: 250 },
	      { text: 'Quantity per Unit', columngroup: 'ProductDetails', datafield: 'QuantityPerUnit', cellsalign: 'right', align: 'right', width: 200 },
	      { text: 'Unit Price', columngroup: 'ProductDetails', datafield: 'UnitPrice', align: 'right', cellsalign: 'right', cellsformat: 'c2', width: 200 },
	      { text: 'Units In Stock', datafield: 'UnitsInStock', cellsalign: 'right', cellsrenderer: cellsrenderer, width: 100 },
	      { text: 'Discontinued', columntype: 'checkbox', datafield: 'Discontinued' }
	    ],
	    columngroups: [
	        { text: 'Product Details', align: 'center', name: 'ProductDetails' }
	    ]
	});
});
</script>
<%@include file="../include/header.jsp" %>
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-1">함께가는교회 정보 설정</h1>
                        <div class="card mb-4">
                            <div class="card-body">
							    <div id="grid" width="100%">
							    </div>
                            </div>
                        </div>
 					</div> 
                </main>
<!--                 <footer class="py-4 bg-light mt-auto"> -->
<!--                     <div class="container-fluid px-4"> -->
<!--                         <div class="d-flex align-items-center justify-content-between small"> -->
<!--                             <div class="text-muted">Copyright &copy; Your Website 2023</div> -->
<!--                             <div> -->
<!--                                 <a href="#">Privacy Policy</a> -->
<!--                                 &middot; -->
<!--                                 <a href="#">Terms &amp; Conditions</a> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </footer> -->
            </div>
<%@include file="../include/footer.jsp" %>
