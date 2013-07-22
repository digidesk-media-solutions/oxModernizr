$( document ).ready( function()
{

    /**
     * Produktmenge im Mini-Warenkorb (Header) änderbar machen
     */
    if( dd_oxModernizr.oSettings.dd_blMiniBasketAmount )
    {
        if( typeof updateMiniBasket === "undefined" && dd_oxModernizr.oSettings.dd_blMiniBasketAjax === false )
        {
            updateMiniBasket = function()
            {
                var oForm = $( '#basketFlyout').find('form[name^="basket"]' );

                oForm.find( 'input[name="renderPartial"]' ).remove();

                // aktiven Controller setzen, da dieser im Widget nicht abgefragt werden kann.
                oForm.find( 'input[name="cl"]' ).val( dd_oxModernizr.oVars.sActiveClassName );
                oForm.submit();
            }
        }

        // Binded alle Events zum Ändern der Produktmenge im Mini-Warenkorb
        initMiniBasketFunctions = function()
        {
            if ($(".scrollable .scrollbarBox").length > 0) {
                $('.scrollable .scrollbarBox').jScrollPane({
                    showArrows: true,
                    verticalArrowPositions: 'split'
                });
            }

            $( '.dd_oxModernizr_basketFlyout .changeAmount .ctrl' ).click( function()
            {
                awsmInfiniteLoopPr0tect0r = 0;

                var self = $( this ),
                    oAmountInput = self.siblings( 'input.amount' ),
                    iAmount = parseInt( oAmountInput.val() );

                if( self.hasClass( 'down' ) )
                {
                    if( iAmount - 1 == 0 )
                    {
                        if( dd_oxModernizr.oSettings.dd_blMiniBasketjQueryUiConfirm )
                        {
                            var buttonsOpts = {};

                            buttonsOpts[dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_MINIBASKET_YES] = function( x, y, z )
                            {
                                $( this ).dialog( "close" );
                                self.closest( 'li' ).slideUp();
                                oAmountInput.val( '0' );
                                updateMiniBasket();
                            }
                            buttonsOpts[dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_MINIBASKET_NO] = function() { $( this ).dialog( "close" ); }

                            $( '<div>' ).html( dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_MINIBASKET ).dialog({
                                title: dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_MINIBASKET_TITLE,
                                resizable: false,
                                height:140,
                                modal: true,
                                buttons: buttonsOpts
                            });
                        }
                        else
                        {
                            if( confirm( dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_MINIBASKET ) )
                            {
                                self.closest( 'li' ).slideUp();
                                oAmountInput.val( '0' );
                                updateMiniBasket();
                            }
                        }

                        return;
                    }
                    else
                    {
                        --iAmount;
                    }

                }
                else
                {
                    ++iAmount
                }

                oAmountInput.val( iAmount );

                updateMiniBasket();
            } );

            $( '.dd_oxModernizr_basketFlyout .changeAmount input.amount' ).change( function()
            {
                awsmInfiniteLoopPr0tect0r = 0;

                var self = $( this );
                if( self.val() == '0' )
                {
                    if( dd_oxModernizr.oSettings.dd_blMiniBasketjQueryUiConfirm )
                    {
                        var buttonsOpts = {};

                        buttonsOpts[dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_MINIBASKET_YES] = function( x, y, z )
                        {
                            $( this ).dialog( "close" );
                            self.closest( 'li' ).slideUp();
                            updateMiniBasket();
                        }
                        buttonsOpts[dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_MINIBASKET_NO] = function() { $( this ).dialog( "close" ); }

                        $( '<div>' ).html( dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_MINIBASKET ).dialog({
                            title: dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_MINIBASKET_TITLE,
                            resizable: false,
                            height:140,
                            modal: true,
                            buttons: buttonsOpts
                        });
                    }
                    else
                    {
                        if( confirm( dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_MINIBASKET ) )
                        {
                            self.closest( 'li' ).slideUp();
                            updateMiniBasket();
                        }
                    }
                }
                else
                {
                    updateMiniBasket();
                }
            });

            if( dd_oxModernizr.oSettings.dd_blMiniBasketDelete )
            {
                $( '.dd_oxModernizr_basketFlyout .deleteProduct' ).click( function()
                {
                    $( this ).parent().find( '.changeAmount input.amount' ).val( '0' ).change();
                } );
            }
        }

        initMiniBasketFunctions();
    }

});