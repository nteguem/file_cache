<div class="vd_title-section clearfix">
    <div class="vd_panel-header no-subtitle">
        <h1>{$Titre}</h1>
    </div>
</div>

<div class="vd_content-section clearfix">
    <div class="row">
        <div class="col-sm-9">
            <div class="panel widget light-widget">
                <div class="panel-body" style="padding:40px;">
                    <div class="pull-right text-right">
                        <h3 class="font-semibold mgbt-xs-20">FACTURE</h3>
                        <table class="table table-bordered">
                            <tbody>
                            <tr>
                                <th> No. Facture</th>
                                <th>Date</th>
                            </tr>
                            <tr>
                                <td>I-24051301</td>
                                <td>{$sLaDate}</td>
                            </tr>
                            </tbody></table>
                    </div>
                    <div class="mgbt-xs-20"><img alt="logo" src="http://prod.alaxione.fr/img/logo-noir.png"></div>
                    <address>
                        69 rue du Rouet<br>
                        13008 Marseille<br>
                        <abbr title="Phone">P:</abbr> (0033) 4 88 00 89 69<br>
                        <br>
                        contact@alaxione.fr
                    </address>
                    <hr>
                    <br>
                    <div class="pd-25">
                        <div class="row">
                            <div class="col-xs-3">
                                <address>
                                    <strong>Facturé à:</strong><br>
                                    {$sNomentite}<br>
                                    {$sAdresseEntite}<br>
                                    {$sTelEntite}<br>
                                    {$sEmailEntite}
                                </address>
                            </div>
                            <div class="col-xs-4">
                                {*<address>
                                    <strong>Ship To:</strong><br>
                                    John Doe<br>
                                    795 Folsom Ave, Suite 600<br>
                                    San Francisco, CA 94107<br>
                                </address>
*}
                            </div>
                            <div class="col-xs-2">
                                <address>
                                    <strong> Date:</strong><br>
                                   {$sLaDate}
                                </address>
                            </div>
                            <div class="col-xs-3">
                                {*<div class="text-right">
                                    <strong>Due Balance:</strong><br>
                                    <span class="mgtp-5 vd_green font-md">$2499.99</span>
                                </div>
                                *}
                            </div>
                        </div>
                    </div>
                    <table class="table table-condensed table-striped">
                        <thead>
                        <tr>
                            <th class="text-center" style="width:20px;">QTY</th>
                            <th>DESCRIPTION</th>
                            <th class="text-right" style="width:120px;">PRIX</th>
                            <th class="text-right" style="width:120px;">TVA</th>
                            <th class="text-right" style="width:120px;">TOTAL</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="text-center">1</td>
                            <td>Samsung Galaxy Note 3 III N900 32gb Black Factory Unlocked Android Cell Phone</td>
                            <td class="text-right">$649.99</td>
                            <td class="text-right">$649.99</td>
                            <td class="text-right">$649.99</td>
                        </tr>
                        <tr>
                            <td class="text-center">2</td>
                            <td>Xbox One Console</td>
                            <td class="text-right">$500.00</td>
                            <td class="text-right">$500.00</td>
                            <td class="text-right">$1000.00</td>
                        </tr>
                        <tr>
                            <td class="text-center">1</td>
                            <td>Apple iPhone 5s, Gold 16GB (Unlocked)</td>
                            <td class="text-right">$700.00</td>
                            <td class="text-right">$700.00</td>
                            <td class="text-right">$700.00</td>
                        </tr>
                        <tr>
                            <td class="text-center">1</td>
                            <td>Keurig K-Cup Home Brewer</td>
                            <td class="text-right">$100.00</td>
                            <td class="text-right">$100.00</td>
                            <td class="text-right">$100.00</td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                            <th colspan="2" rowspan="3" class="bdr">Note:
                                <p class="font-normal">Please send all of these items using wooden box package.</p></th>
                            <th class="text-right pd-10">Sub Total</th>
                            <th class="text-right pd-10">$2449.99</th>
                            <th class="text-right pd-10">$2449.99</th>
                        </tr>
                        <tr>
                            <th class="text-right  pd-10 no-bd">Discount</th>
                            <th class="text-right  pd-10 vd_red no-bd">($100.00)</th>
                        </tr>
                        <tr>
                            <th class="text-right  pd-10 no-bd">Total</th>
                            <th class="text-right  pd-10 no-bd">$50.00</th>
                        </tr>

                        <tr>
                            <th colspan="2">Date d'échéance de règlement 16/10/2016</th>
                            <th class="text-right  pd-10"></th>
                            <th class="text-right  pd-10 "><span class="vd_green font-sm font-normal"></span></th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
                <!-- panel-body -->

            </div>
            <!-- Panel Widget -->
        </div>
        <!-- col-sm-9-->
        <div class="col-sm-3">
            <div class="mgbt-xs-5">
                <button class="btn vd_btn vd_bg-grey" type="button"><i class="fa fa-print append-icon"></i>Print</button>
            </div>
            <div class="mgbt-xs-5">
                <button class="btn vd_btn vd_bg-green " type="button"><i class="fa fa-download append-icon"></i>Save as PDF</button>
            </div>
        </div>
    </div>
    <!-- row -->

</div>