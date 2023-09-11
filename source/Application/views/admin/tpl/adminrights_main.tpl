[{include file="headitem.tpl" title="GENERAL_ADMIN_TITLE"|oxmultilangassign}]

<script type="text/javascript">
    <!--
    function editThis( sID )
    {
        let oTransfer = top.basefrm.edit.document.getElementById( "transfer" );
        oTransfer.oxid.value = sID;
        oTransfer.cl.value = top.basefrm.list.sDefClass;

        //forcing edit frame to reload after submit
        top.forceReloadingEditFrame();

        let oSearch = top.basefrm.list.document.getElementById( "search" );
        oSearch.oxid.value = sID;
        oSearch.actedit.value = 0;
        oSearch.submit();
    }

    window.onload = function ()
    {
        [{if $updatelist == 1}]
            top.oxid.admin.updateList('[{$oxid}]');
        [{/if}]
        let oField = top.oxid.admin.getLockTarget();
        oField.onchange = oField.onkeyup = oField.onmouseout = top.oxid.admin.unlockSave;
    }

    function toggle(reference) {
        let i = 0;
        let toggled = document.querySelectorAll('#' + reference.parentNode.id + ' > ul');
        while (i < toggled.length) {
            if (toggled[i].style.display === "none" || toggled[i].style.display === '') {
                toggled[i].style.display = "block";
            } else {
                toggled[i].style.display = "none";
            }
            i++;
        }
    }

    function selectChilds(reference) {
        let i = 0;
        let childs = document.querySelectorAll("#" + reference.parentNode.id + " [type='checkbox']");
        while (i < childs.length) {
            childs[i].checked = reference.checked;
            i++;
        }

        selectParent(reference);
    }

    function selectParent(reference) {
        if (reference.parentNode && reference.parentNode.parentNode && reference.parentNode.parentNode.parentNode && reference.parentNode.parentNode.parentNode.id) {
            let parent = document.querySelectorAll("#" + reference.parentNode.parentNode.parentNode.id + " > input[type='checkbox']")[0];
            if (parent && reference.checked) {
                parent.checked = reference.checked
                selectParent(parent);
            }
        }
    }

    //-->
</script>

[{if $readonly}]
    [{assign var="readonly" value="readonly disabled"}]
[{else}]
    [{assign var="readonly" value=""}]
[{/if}]

<style>
    ul#nav li,
    ul#nav li li {
        list-style: none;
        background: none;
    }

    #nav li ul {
        padding: 0 0 0 5px;
        display: none;
        position: relative;
    }

    ul#nav > li > ul {
        display: block;
    }

    #nav input {
        margin-right: 5px;
    }
    .vatop {
        vertical-align: top;
    }

    #nav ul li{
        margin-left: 3px;
        border-left : 1px solid #AAA;
    }

    #nav ul li:last-child{
        border-color : transparent;
    }

    #nav ul li::before{
        content: '';
        display: block;
        position: absolute;
        margin-top: -3px;
        left: 8px;
        width: 10px;
        height: 10px;
        border: solid #AAA;
        border-width: 0 0 1px 1px;
        float: left;
    }
</style>

<form name="transfer" id="transfer" action="[{$oViewConf->getSelfLink()}]" method="post">
    [{$oViewConf->getHiddenSid()}]
    <input type="hidden" name="oxid" value="[{$oxid}]">
    <input type="hidden" name="oxidCopy" value="[{$oxid}]">
    <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
    <input type="hidden" name="editlanguage" value="[{$editlanguage}]">
</form>

<form name="myedit" id="myedit" action="[{$oViewConf->getSelfLink()}]" method="post" style="padding: 0;margin: 0;height:0;">
    [{$oViewConf->getHiddenSid()}]
    <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
    <input type="hidden" id="fnc" name="fnc" value="">
    <input type="hidden" name="oxid" value="[{$oxid}]">
    <input type="hidden" name="editval[o3rightsroles__oxid]" value="[{$oxid}]">

    <table style="border: 0; border-collapse: collapse; border-spacing: 0; width:98%;">
        <tr>
            <td class="vatop edittext" style="width: 50%; padding-top:10px;padding-left:10px;">
                <table>
                    [{block name="admin_adminrights_main_left"}]
                        <tr>
                            <td class="edittext" style="width: 120px;">
                                <label for="o3rightsroles__active">
                                    [{oxmultilang ident="RIGHTSROLES_ACTIVE"}]
                                </label>
                            </td>
                            <td class="edittext">
                                <input type="hidden" name="editval[o3rightsroles__active]" value='0' [{$readonly}]>
                                <input id="o3rightsroles__active" class="edittext" type="checkbox" name="editval[o3rightsroles__active]" value='1' [{if $edit->o3rightsroles__active->value == 1}]checked[{/if}] [{$readonly}]>
                                [{oxinputhelp ident="HELP_RIGHTSROLES_ACTIVE"}]
                            </td>
                        </tr>
                        <tr>
                            <td class="edittext">
                                <label for="o3rightsroles__restrictedview">
                                    [{oxmultilang ident="RIGHTSROLES_RESTRICTEDVIEW"}]
                                </label>
                            </td>
                            <td class="edittext">
                                <input type="hidden" name="editval[o3rightsroles__restrictedview]" value='0' [{$readonly}]>
                                <input id="o3rightsroles__restrictedview" class="edittext" type="checkbox" name="editval[o3rightsroles__restrictedview]" value='1' [{if $edit->o3rightsroles__restrictedview->value == 1}]checked[{/if}] [{$readonly}]>
                                [{oxinputhelp ident="HELP_RIGHTSROLES_RESTRICTEDVIEW"}]
                            </td>
                        </tr>
                        <tr>
                            <td class="edittext">
                                <label for="o3rightsroles__title">
                                    [{oxmultilang ident="RIGHTSROLES_TITLE"}]
                                </label>
                            </td>
                            <td class="edittext">
                                <input id="o3rightsroles__title" type="text" class="editinput" size="25" maxlength="[{$edit->o3rightsroles__title->fldmax_length}]" name="editval[o3rightsroles__title]" value="[{$edit->o3rightsroles__title->value}]" [{$readonly}]>
                                [{oxinputhelp ident="HELP_RIGHTSROLES_TITLE"}]
                            </td>
                        </tr>
                        <tr>
                            <td class="vatop">
                                [{oxmultilang ident="RIGHTSROLES_ITEMS"}]
                            </td>
                            <td>
                                [{assign var="selectedElements" value=$roleElementsList->getElementsIdsByRole($oxid)}]
                                [{assign var="cssClass" value="nav"}]
                                <ul id="nav">
                                    [{assign var="deepLevel" value=0}]
                                    [{defun name="tree" root=$oView->getMenuTree() cssClass=$cssClass}]
                                        [{assign var="index" value=0}]
                                        [{foreach name="loop" from=$root item="menuitem"}]
                                            [{assign var="deepLevel" value=$deepLevel+1}]
                                            [{if $menuitem->nodeType == XML_ELEMENT_NODE && $menuitem->nodeName != "BTN"}]
                                                [{assign var="index" value=$index+1}]
                                                [{assign var="currCssClass" value=$cssClass|cat:"-"|cat:$index}]
                                                <li id="[{$currCssClass}]">
                                                    [{assign var="menuid" value=$menuitem->getAttribute('id')}]
                                                    <input onclick="selectChilds(this);" id="[{$menuid}]" type="checkbox" name="roleElements[]" value="[{$menuid}]" [{if $menuid|in_array:$selectedElements}]checked[{/if}]>
                                                    <label for="[{$menuid}]"></label>
                                                    [{if $menuitem->childNodes->length}]<a onclick="toggle(this)" href="#" class="rc">[{/if}]
                                                        [{if $menuitem->childNodes->length}]&raquo; [{/if}]
                                                        [{oxmultilang ident=$menuitem->getAttribute('name')|default:$menuid noerror=true}]
                                                    [{if $menuitem->childNodes->length}]</a>[{/if}]
                                                    [{if $menuitem->childNodes->length}]
                                                        <ul>
                                                            [{fun name="tree" root=$menuitem->childNodes cssClass=$currCssClass}]
                                                        </ul>
                                                    [{/if}]
                                                </li>
                                                [{assign var="deepLevel" value=$deepLevel-1}]
                                            [{/if}]
                                        [{/foreach}]
                                    [{/defun}]
                                </ul>
                            </td>
                        </tr>
                    [{/block}]
                    <tr>
                        <td class="edittext" colspan="2"><br>
                            [{include file="language_edit.tpl"}]<br>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" class="edittext" id="oLockButton" name="saveArticle" value="[{oxmultilang ident="ARTICLE_MAIN_SAVE"}]" onClick="document.myedit.fnc.value='save'" [{$readonly}]>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="vatop edittext" style="width: 50%; padding-top:10px;padding-left:10px;">

                <!-- Starting right column -->
                <table>
                    <tr>
                        <td class="edittext">
                            [{block name="admin_adminrights_main_assign_users"}]
                                [{if $oxid != "-1" && !$edit->o3rightsroles__restrictedview->value}]
                                    <input [{$readonly}] type="button" value="[{oxmultilang ident="GENERAL_ASSIGNUSERS"}]" class="edittext" onclick="showDialog('&cl=adminrights_main&aoc=1&oxid=[{$oxid}]');">
                                [{/if}]
                            [{/block}]
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>

[{include file="bottomnaviitem.tpl"}]
[{include file="bottomitem.tpl"}]
