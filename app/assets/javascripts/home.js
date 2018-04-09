$( document ).ready( function() {
  $( '#sports-table' ).DataTable();
  $( 'div.hide' ).removeClass( 'hide' );

  $( '#sport-changer' ).on( 'change', function( e ) {
    window.location.href = '/?sport=' + e.target.value;
  });
});
