<div class="navbar-menu clearfix">
    <h5 class="menu-title hide-nav-medium hide-nav-small" style="margin-top: 20px;"  align="center"><span id="date_heure"></span></h5>
    <div class="vd_menu">
        <ul>
            <li>
                <a href="main.php?dir=rechdispo">
                    <span class="menu-icon"><i class="fa fa-calendar"></i></span>
                    <span class="menu-text">Agenda</span>

                </a>
            </li>
            <li>
                <a href="main.php?dir=gestdiscuprat">
                    <span class="menu-icon"><i class="fa fa-envelope"></i></span>
                    <span class="menu-text">Messagerie</span>
                    <span class="menu-badge"><span class="badge vd_bg-red" id="nb_message_interne" style="display: none;"></span></span>
                </a>
            </li>

            <li>
                <a href="javascript:void(0);" data-action="click-trigger">
                    <span class="menu-icon"><i class="fa fa-cog"></i></span>
                    <span class="menu-text">Paramétrage</span>
                    <span class="menu-badge"><span class="badge vd_bg-black-30"><i class="fa fa-angle-down"></i></span></span>
                </a>

                <div class="child-menu" data-action="click-target" style="display: none;">
                    <ul>
                        <li>
                            <a href="main.php?dir=gestmsmsvoice">
                                <span class="menu-text">Gestion des messages mail, sms et vocal</span>
                            </a>
                        </li>
                        <li>
                            <a href="main.php?dir=gestuseran">
                                <span class="menu-text">Vos utilisateurs</span>
                            </a>
                        </li>
                        <li>
                            <a href="utilisateur/compte.php">
                                <span class="menu-text">Mon compte</span>
                            </a>
                        </li>
                        <li>
                            <a href="main.php?dir=boc">
                                <span class="menu-text">Vos lieux de consultation</span>
                            </a>
                        </li>
                        <li>
                            <a href="main.php?dir=boc_gestion_user">
                                <span class="menu-text">Vos praticiens</span>
                            </a>
                        </li>
                        <li>
                            <a href="main.php?dir=boc_type_rdv">
                                <span class="menu-text">Vos types de RDV</span>
                            </a>
                        </li>
                        <li>
                            <a href="main.php?dir=geststructurebo">
                                <span class="menu-text">Votre structure</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>
            <li>
                <a href="main.php?dir=listerdv">
                    <span class="menu-icon"><i class="fa fa-list"></i></span>
                    <span class="menu-text">Liste Rendez vous</span>

                </a>
            </li>
            <li>
                <a href="deco.php">
                    <span class="menu-icon"><i class="fa fa-sign-out"></i></span>
                    <span class="menu-text">Déconnexion</span>
                </a>
            </li>
        </ul>
        <!-- Head menu search form ends -->
    </div>
</div>