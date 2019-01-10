  $(document).ready(function() {

    $('#listtab').DataTable({
      scrollY: "43vh",
      scrollCollapse: true,
      paging: false,
      autoWidth: true,
      responsive: true,
      retrieve: true,
      dom: 'Bfrtip',
      buttons: [
        {
        extend: 'print',
        title: 'Not Called This Week'
        }
      ]
    });

    $("#btnPrint").printPreview({
      obj2print:'#main'
    });

  });
