$( document ).ready( function()
{
    // Wird nur ausgeführt, wenn die Option "dd_blMiniBasketAjax" im Modul aktiv ist.
    if( dd_oxModernizr.oSettings.dd_blMiniBasketAjax )
    {
        updateMiniBasket = function()
        {
            var oBasketFlyout = $( '#basketFlyout' ),
                oForm = oBasketFlyout.find('form[name^="basket"]' );

            if( awsmInfiniteLoopPr0tect0r <= 1)
            {
                // aktiven Controller setzen, da dieser im Widget nicht abgefragt werden kann.
                $( 'input[name="cl"]', oForm ).val( 'dd_oxmodernizr_minibasket_ajax' );

                oBasketFlyout.find('.ajaxLoading' ).show();

                $.ajax(
                {
                    url: dd_oxModernizr.oVars.sSelfActionLink,
                    data: oForm.serialize(),
                    dataType: 'json',
                    success: function( sData )
                    {
                        awsmInfiniteLoopPr0tect0r++;

                        $( '#miniBasket' ).remove();
                        $( '#basketFlyout' ).replaceWith( sData.content );

                        initMiniBasketFunctions(); // Javascript-Events neu binden
                        $( '#miniBasket' ).oxMiniBasket();

                        if( dd_oxModernizr.oVars.sActiveClassName == 'basket' )
                        {
                            var oForm = $( '#content' ).find( 'form[name="basket"].dd_oxModernizr_basket' ).first();
                            oForm.find('input[name="fnc"]' ).val( '' );
                            updateBasket();
                        }
                    }
                });
            }
        }
    }

} );