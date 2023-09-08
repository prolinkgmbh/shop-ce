[{assign var="oConfig" value=$oViewConf->getConfig()}]
<ul>
    [{block name="admin_header_links"}]
    <li class="act">
        <a href="[{$oViewConf->getSelfLink()}]&cl=navigation&item=home.tpl" id="homelink" target="basefrm" class="rc">
            <b>[{oxmultilang ident="NAVIGATION_HOME"}]</b>
        </a>
    </li>

    [{if $oView->canHaveRestrictedView()}]
        <li class="sep">
            <a href="[{$oViewConf->getSelfLink()}]&cl=navigation&item=header.tpl&fnc=toggleAdminView" id="adminviewlink" class="rc">
                <b>
                    [{if $oView->canShowAllMenuItems()}]
                        [{oxmultilang ident="NAVIGATION_REDUCEDVIEW"}]
                    [{else}]
                        [{oxmultilang ident="NAVIGATION_FULLVIEW"}]
                    [{/if}]
                </b>
            </a>
        </li>
    [{/if}]

    <li class="sep">
        <a href="[{$oConfig->getShopURL()}]" id="shopfrontlink" target="_blank" class="rc">
            <b>[{oxmultilang ident="NAVIGATION_SHOPFRONT"}]</b>
        </a>
    </li>
    <li class="sep">
        <a href="[{$oViewConf->getSelfLink()}]&cl=navigation&fnc=logout" id="logoutlink" target="_parent" class="rc">
            <b>[{oxmultilang ident="NAVIGATION_LOGOUT"}]</b>
        </a>
    </li>
    [{/block}]
</ul>

[{if $doRedirect}]
    <script type="text/javascript">
        window.top.location = "[{$oViewConf->getSelfLink()|replace:"&amp;":"&"}]";
    </script>
[{/if}]
