$( document ).ready( function()
{
    // Wird nur ausgeführt, wenn die Option "dd_blToBasketAnimation" im Modul aktiv ist.
    if( dd_oxModernizr.oSettings.dd_blToBasketAnimation )
    {
        $( 'form input[name="fnc"][value="tobasket"]' ).closest( 'form' ).submit( function() {

            var self                  = $( this ),
                oProductImg           = $( 'img[src*="/out/pictures/generated/"]', self ).first();

            if( oProductImg.length > 0 )
            {
                self.prepend( '<input type="hidden" name="open_minibasket" value="1">' );

                var oProductImgOffset     = oProductImg.offset(),
                    oAnimationImg         = oProductImg.clone(),
                    oMiniBasketIcon       = $( '#minibasketIcon' ),
                    oMiniBasketIconOffset = oMiniBasketIcon.offset();

                oAnimationImg.css(
                {
                    position: 'absolute',
                    top: oProductImgOffset.top,
                    left: oProductImgOffset.left,
                    zIndex: 999
                } ).prependTo( $( 'body' ) ).animate(
                {
                    top: oMiniBasketIconOffset.top + 5,
                    left: oMiniBasketIconOffset.left,
                    width: oMiniBasketIcon.width()
                }, 1000, function()
                {
                    oAnimationImg.fadeOut();
                    $( '#basketFlyout' ).show();
                } );
            }
        });
    }

} );