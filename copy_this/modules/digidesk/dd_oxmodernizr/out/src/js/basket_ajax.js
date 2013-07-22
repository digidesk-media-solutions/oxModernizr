$( document ).ready( function()
{
    // Wird nur ausgeführt, wenn die Option "dd_blBasketAjax" im Modul aktiv ist.
    if( dd_oxModernizr.oSettings.dd_blBasketAjax )
    {
        var oBasketForm = $( '#content' ).find( 'form[name="basket"]' );

        if( oBasketForm.length > 0 )
        {
            updateBasket = function()
            {
                var oForm = $( '#content' ).find( 'form[name="basket"].dd_oxModernizr_basket' ).first();

                if( awsmInfiniteLoopPr0tect0r <= 1)
                {
                    // aktiven Controller setzen, damit nur der Content des Formulares per AJAX zurück kommt
                    $( 'input[name="cl"]', oForm ).val( 'dd_oxmodernizr_basket_ajax' );
                    // Funktionsparameter erneut setzen, da dieser vom Minibasket entfernt worden sein könnte.
                    $( 'input[name="fnc"]', oForm ).val( 'changebasket' );

                    if( oForm.find( '.ajaxLoading' ).length == 0)
                    {
                        oForm.prepend( '<div class="ajaxLoading"></div>' );
                    }
                    oForm.prepend( '<input type="hidden" name="renderPartial" value="1">' );

                    $( '.ajaxLoading', oForm ).show();

                    $.ajax({
                        url: dd_oxModernizr.oVars.sSelfActionLink,
                        data: oForm.serialize() + '&updateBtn',
                        type: 'POST',
                        dataType: 'json',
                        success: function( sData )
                        {
                            awsmInfiniteLoopPr0tect0r++;

                            var oData = $( sData.content ),
                                oBasketFlyout = $( '#basketFlyout' ).find('form[name^="basket"]' );
                            oData.find( 'form[name="basket"]' ).addClass( 'dd_oxModernizr_basket' );

                            oForm.replaceWith( sData.content );

                            $('#checkAll, #basketRemoveAll').oxBasketChecks();
                            $( '.wrappingTrigger' ).oxModalPopup({ target: '.wrapping'});

                            initBasketFunctions(); // Javascript-Events neu binden

                            oBasketFlyout.prepend('<input type="hidden" name="prevent_open_minibasket" value="1">' );
                            oBasketFlyout.find('input[name="fnc"]' ).val( '' );
                            updateMiniBasket();
                        }
                    });
                }
            }
        }
    }

} );