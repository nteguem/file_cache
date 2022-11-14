{foreach from=$aListe item=objListe} {foreach name="enteteliste" from=$aEnteteListe item=objEnteteListe}{$objListe[$objEnteteListe.objElement.nom_variable]};{/foreach}
    {/foreach}