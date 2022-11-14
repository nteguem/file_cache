{if $bDebugRequete}
    <p>
        Requete Select : <br><br>
        {$sDebugRequeteSelect}<br><br>
        Requete Insert/Update : <br><br>
        {$sDebugRequeteInsertUpdate}<br><br>
    </p>
{/if}
{if isset($sScriptJavascriptInsert)}
    {$sScriptJavascriptInsert}
{/if}
{if isset($sScriptJavascriptUpdate)}
    {$sScriptJavascriptUpdate}
{/if}
<div class="vd_title-section clearfix">
    <div class="vd_panel-header">
        <h1>{$sTitreListe}</h1>
    </div>
</div>
<div class="vd_content-section clearfix">
	<br>
	<b>{$iTabListeCount} {$sLabelNbrLigne}</b>
	<br>
	<br>

	<div class="row">
	        <div class="col-md-12">
	            <div class="panel widget">
	                <div class="panel-heading vd_bg-grey">
	                    <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-dot-circle-o"></i> </span>{$sTitreListe}</h3>
	                </div>
	                 <div class="panel-body-list table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>

                                </tr>
                            </thead>

	                 </div>
	            </div>
	        </div>
	</div>
</div>