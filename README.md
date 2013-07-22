oxModernizr
===========

Dieses Modul versorgt das OXID eShop-Frontend mit den modernsten User-Interface-Elementen und Techniken.

> Achtung: Dieses Modul ist auf die Theme-HTML-Struktur vom Standard-Azure-Theme ausgelegt. Für eigene Themes müssen ggf. Anpassungen im Mini-Warenkorb (Header) dieses Moduls gemacht werden.

## Funktionsumfang
Folgende Einstellungen können in diesem Modul getroffen werden:

### Performance
- CSS-Dateien dieses Moduls in minimierter Form einbinden. (spart ca. 1/4 Traffic)
- JavaScript-Dateien dieses Moduls in minimierter Form einbinden. ( spart ca. 2/3 Traffic) 


### allgemeine Benutzerfreundlichkeit
- Eingabefelder mit einem Clear-Button ausstatten, um diese mit einem Klick leeren zu können.
- - Beispiel: ![](http://s14.directupload.net/images/130722/o8k2978t.png)

### Effekte
- Produkbild-Animation, wenn man ein Produkt zum Warenkorb hinzufügt.

### Warenkorb
- "+/-"-Buttons bei der Anzahl eines Produktes anzeigen
- Bestätigungs-Dialoge mit jQuery-UI darstellen. Info: Ein Bestätigungs-Dialog erscheint z.B., wenn man die Menge eines Produktes im Warenkorb auf "0" setzt.
- Produktmengenänderungen im Warenkorb per AJAX durchführen.
- Button, um ein Produkt aus dem Warenkorb zu löschen, im Warenkorb bereitstellen.

### Mini-Warenkorb (Header)
- Produkt-Thumbnails im Mini-Warenkorb anzeigen.
- Produktmenge im Mini-Warenkorb änderbar machen
- Bestätigungs-Dialoge mit jQuery-UI darstellen. Ein Bestätigungs-Dialog erscheint z.B., wenn man die Menge eines Produktes im Mini-Warenkorb auf "0" setzt.
- Produktmengenänderungen im Mini-Warenkorb per AJAX durchführen.
- Button, um ein Produkt aus dem Warenkorb zu löschen, im Mini-Warenkorb bereitstellen.

## Screenshots
- Eingabefelder mit Clear-Button:

![Eingabefelder mit Clear-Button](http://s14.directupload.net/images/130722/o8k2978t.png)

- Mini-Warenkorb mit allen aktiven Einstellungen:

![Mini-Warenkorb](http://s7.directupload.net/images/130722/n3mjgsso.png)

- Warenkorb mit allen aktiven Einstellungen:

![Warenkorb](http://s1.directupload.net/images/130722/z8uctgvp.png)

## Verwendete Entwicklungs-Tool
- Jetbrains PhpStorm
- Node.js
- LESS-Compiler
- UglifyJS

## Third-Party-Libraries
- [jQuery-UI](http://jqueryui.com/support/)

## Support & Weiterentwicklung
- Bugs bitte am besten direkt hier oder im OXID Forum melden.
- Weiterentwicklungen von der Community nehme ich natürlich gerne an. Einfach einen Pull Request starten.
