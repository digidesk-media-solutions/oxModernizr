$( document ).ready( function()
{

    /**
     * Eingabefelder um einen Clear-Button erweitern
     */
    if( dd_oxModernizr.oSettings.dd_blEnabledClearInput )
    {
        $( 'input[type="text"], input[type="password"], input[type="date"], input[type="color"], ' +
           'input[type="datetime"], input[type="datetime-local"], input[type="email"], input[type="month"], ' +
           'input[type="number"], input[type="tel"], input[type="search"], input[type="url"], ' +
           'input[type="week"]' ).not( '.no_oxModernizr' ).bind( 'focus', function()
        {
            $( 'body > .dd_clearInput' ).remove();

            var self      = $( this ),
                oClearBtn = $( document.createElement( 'i' ) ).html( '&times;' ).addClass( 'dd_clearInput' ).appendTo( document.body ),
                iLeftPos  = 0;

            /*
             * Timeout wird benötigt, um ggf. vorher ablaufende Animationen zu registrieren, damit die Position des
             * Clear-Buttons später korrekt gesetzt wird.
             */
            window.setTimeout( function()
            {
                if( self.width() < oClearBtn.width() * 3 )
                {
                    iLeftPos = self.offset().left + self.width() + ( oClearBtn.width() + 3 );
                }
                else
                {
                    iLeftPos = self.offset().left + self.width() - ( oClearBtn.width() - 6 );
                }

                // Clear-Button am fokussierten Input-Element positionieren
                oClearBtn.css(
                {
                    left: iLeftPos,
                    top: self.offset().top + self.height() / 2 - oClearBtn.height() / 2
                } ).addClass( 'show' ).click( function( e )
                {
                    self.val( '' ).focus();
                } );

                self.bind( 'blur', function()
                {
                    // Timeout wird benötigt, damit der Klick auf den Clear-Button noch registriert wird, bevor er entfernt wird.
                    window.setTimeout( function()
                    {
                        if( !self.is( ':focus' ) )
                            oClearBtn.removeClass( 'show' )
                    }, 180)
                } );
            }, 180)

        } );
    }

});