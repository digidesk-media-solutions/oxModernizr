$( document ).ready( function()
{
    /**
     * Produktmenge im Warenkorb änderbar machen
     */
    if( dd_oxModernizr.oSettings.dd_blBasketAmount )
    {
        if( typeof updateBasket === "undefined" && dd_oxModernizr.oSettings.dd_blBasketAjax === false )
        {
            updateBasket = function()
            {
                $( '#content' ).find( 'form[name="basket"].dd_oxModernizr_basket' ).submit();
            }
        }

        // Binded alle Events zum Ändern der Produktmenge im Warenkorb
        initBasketFunctions = function()
        {
            $( '#content' ).find( 'form[name="basket"]' ).first().addClass( 'dd_oxModernizr_basket' );

            $( '.dd_oxModernizr_basket .changeAmount .ctrl' ).click( function()
            {
                awsmInfiniteLoopPr0tect0r = 0;

                var self = $( this ),
                    oAmountInput = self.siblings( 'input.amount' ),
                    iAmount = parseInt( oAmountInput.val() );

                if( self.hasClass( 'down' ) )
                {
                    if( iAmount - 1 == 0 )
                    {
                        if( dd_oxModernizr.oSettings.dd_blBasketjQueryUiConfirm )
                        {
                            var buttonsOpts = {};

                            buttonsOpts[dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_BASKET_YES] = function( x, y, z )
                            {
                                $( this ).dialog( "close" );
                                self.closest( 'tr' ).hide();
                                oAmountInput.val( '0' );
                                updateBasket();
                            }
                            buttonsOpts[dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_BASKET_NO] = function() { $( this ).dialog( "close" ); }

                            $( '<div>' ).html( dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_BASKET ).dialog({
                                title: dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_BASKET_TITLE,
                                resizable: false,
                                height:140,
                                modal: true,
                                buttons: buttonsOpts
                            });
                        }
                        else
                        {
                            if( confirm( dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_BASKET ) )
                            {
                                self.closest( 'tr' ).hide();
                                oAmountInput.val( '0' );
                                updateBasket();
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

                updateBasket();
            } );

            $( '.dd_oxModernizr_basket .changeAmount input.amount' ).change( function()
            {
                awsmInfiniteLoopPr0tect0r = 0;

                var self = $( this );
                if( self.val() == '0' )
                {
                    if( dd_oxModernizr.oSettings.dd_blBasketjQueryUiConfirm )
                    {
                        var buttonsOpts = {};

                        buttonsOpts[dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_BASKET_YES] = function( x, y, z )
                        {
                            $( this ).dialog( "close" );
                            self.closest( 'tr' ).hide();
                            updateBasket();
                        }
                        buttonsOpts[dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_BASKET_NO] = function() { $( this ).dialog( "close" ); }

                        $( '<div>' ).html( dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_BASKET ).dialog({
                            title: dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_BASKET_TITLE,
                            resizable: false,
                            height:140,
                            modal: true,
                            buttons: buttonsOpts
                        });
                    }
                    else
                    {
                        if( confirm( dd_oxModernizr.oLangStrings.DD_CONFIRM_REMOVE_ITEM_FROM_BASKET ) )
                        {
                            self.closest( 'tr' ).hide();
                            updateBasket();
                        }
                    }
                }
                else
                {
                    updateBasket();
                }
            });

            if( dd_oxModernizr.oSettings.dd_blBasketDelete )
            {
                $( '.dd_oxModernizr_basket .deleteProduct' ).click( function()
                {
                    $( this ).parent().find( '.changeAmount input.amount' ).val( '0' ).change();
                } );
            }
        }

        initBasketFunctions();
    }

});