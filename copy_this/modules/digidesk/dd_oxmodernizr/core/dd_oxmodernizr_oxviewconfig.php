<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Kai
 * Date: 15.07.13
 * Time: 21:48
 * To change this template use File | Settings | File Templates.
 */

class dd_oxmodernizr_oxviewconfig extends dd_oxmodernizr_oxviewconfig_parent {


    /**
     * Liest die Modul-Settings aus der Metadata.php eines Modules aus, holt die aktiven Werte aus der Datenbank und
     * gibt diese als Array zurück.
     *
     * @param string $sModulePath
     *
     * @return bool|array
     */
    public function getModuleSettings( $sModulePath = 'digidesk/dd_oxmodernizr' )
    {
        /** @var oxViewConfig $this */ // IDE-Quicksearch
        $oConfig = $this->getConfig();

        $sModulePath = $oConfig->getModulesDir() . $sModulePath;
        $sMetadataPath = $sModulePath . '/metadata.php';

        if( is_readable( $sMetadataPath ) )
        {
            /**
             * metadata.php-Datei des angeforderten Modules einbinden...
             * Erzeugt die folgenden Variabeln in diesem Scope:
             * - $aModule
             * - [$sMetadataVersion] (optional)
             */
            include_once $sMetadataPath;

            $aModuleSettings = array();

            if( count( $aModule[ 'settings' ] ) > 0 )
            {
                foreach( $aModule[ 'settings' ] as $aSetting )
                {
                    $aModuleSettings[ $aSetting[ 'name' ] ] = $oConfig->getConfigParam( $aSetting[ 'name' ] );
                }
            }

            return $aModuleSettings;

        }

        return false;

    }


    public function changeminibasket()
    {
        $this->getComponent( 'oxcmp_basket' )->changebasket();
    }

}