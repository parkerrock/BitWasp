<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="{$header.site_description|escape:'html':'UTF-8'}" />
    <title>{$header.title|escape:'html':'UTF-8'} | {$header.site_title|escape:'html':'UTF-8'}</title>
    <link rel="stylesheet" type="text/css" href="{url type="base_url" url=""}assets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="{url type="base_url" url=""}assets/css/style.css">
    <noscript>
        <style type="text/css">
            .nojs {
                display:none;
            }
        </style>
    </noscript>
    <!-- JavaScript -->
    <script src="{url type="base_url" url=""}assets/js/jquery-1.8.1.min.js"></script>
    <script src="{url type="base_url" url=""}assets/js/bootstrap.js"></script>
    <script src="{url type="base_url" url=""}assets/js/bootstrap-treeview.js"></script>
    <script>
        $(function() {

            var menuData = {$category_data.js}

            $('#tree-menu').treeview({
                color: "#428bca",
                // expandIcon: "glyphicon glyphicon-stop",
                //collapseIcon: "glyphicon glyphicon-unchecked",
                nodeIcon: "",
                levels: 99,
                enableLinks: true,
                showTags: true,
                data: menuData
            });
        });
    </script>
    {$header.header_meta}
</head>
<body>
    <div id="is_bitcoin_testnet" data-is-bitcoin-testnet="{$header.bitcoin_testnet|escape}"></div>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="row bodywrap">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                {url type="anchor" url="" text=$header.site_title|escape:"html":"UTF-8" attr="class='navbar-brand'"}
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav navbar-right">
                    {if $current_user.user_role eq 'Admin'}
                        <li>{url type="anchor" url="" text=lang("navbar/home") attr="title='Home'"}</li>
                        <li>{url type="anchor" url="items" text=lang("navbar/items") attr="title='Items'"}</li>
                        <li>{url type="anchor" url="admin" text=lang("navbar/admin") attr="title='Admin'"}</li>
                        <li>{url type="anchor" url="inbox" text=lang("navbar/inbox", [$count_unread_messages]) attr='title="Inbox"'}</li>
                        <li>{url type="anchor" url="account" text=lang("navbar/account") attr="title='Account'"}</li>
                        <li>{url type="anchor" url="logout" text=lang("navbar/logout") attr="title='Logout'"}</li>

                    {elseif $current_user.user_role eq 'Buyer'}
                        <li>{url type="anchor" url="" text="Home" attr="title='Home'"}</li>
                        <li>{url type="anchor" url="items" text=lang("navbar/items") attr="title='Items'"}</li>
                        <li>{url type="anchor" url="inbox" text=lang("navbar/inbox", [$count_unread_messages]) attr='title="Inbox"'}</li>
                        <li>{url type="anchor" url="account" text=lang("navbar/account") attr="title='Account'"}</li>
                        <li>{url type="anchor" url="logout" text=lang("navbar/logout") attr="title='Logout'"}</li>

                    {elseif $current_user.user_role == 'Vendor'}
                        <li>{url type="anchor" url="" text="Home" attr="title='Home'"}</li>
                        <li>{url type="anchor" url="items" text=lang("navbar/items") attr="title='Items'"}</li>
                        <li>{url type="anchor" url="inbox" text=lang("navbar/inbox", [$count_unread_messages]) attr='title="Inbox"'}</li>
                        <li>{url type="anchor" url="account" text=lang("navbar/account") attr="title='Account'"}</li>
                        <li>{url type="anchor" url="logout" text=lang("navbar/logout") attr="title='Logout'"}</li>

                    {elseif $current_user.user_role == 'half'}
                        {if $allow_guests eq TRUE}
                            <li>{url type="anchor" url="" text="Home" attr="title='Home'"}</li>
                            <li>{url type="anchor" url="items" text="Items" attr="title='Items'"}</li>
                        {/if}
                        <li>{url type="anchor" url="logout" text="Logout" attr="title='Logout'"}</li>
                    {else}
                        {if $allow_guests eq TRUE}
                            <li>{url type="anchor" url="" text="Home" attr="title='Home'"}</li>
                            <li>{url type="anchor" url="items" text=lang("navbar/items") attr="title='Items'"}</li>
                        {/if}
                        <li>{url type="anchor" url="login" text=lang("navbar/login") attr="title='Login'"}</li>
                        <li>{url type="anchor" url="register" text=lang("navbar/register") attr="title='Register'"}</li>
                    {/if}
                </ul>
            </div>
            <!-- /.navbar-collapse -->

        </div>
    </nav>

    <div class="row bodywrap">
        <div class="row">
            <!-- Begin: Menu -->
            <div class="col-md-3">
                <div class="col-md-12">
                    {if in_array($current_user.user_role, ['guest','half']) eq FALSE}
                    <!-- Logged in bar-->
                    <div class="list-group">
                        {capture name="t_user_link"}user/{$current_user.user_hash}{/capture}
                        {url type="anchor" url=$smarty.capture.t_user_link text=$current_user.user_name|escape:"html":"UTF-8" attr="class='list-group-item' title='Your Profile'"}

                        {if $current_user['user_role'] eq 'Vendor'}
                            {url type="anchor" url="listings" text=lang("sidebar/my_listings") attr="class='list-group-item' title='My Listings'"}
                            {url type="anchor" url="orders" text=lang("sidebar/orders") attr="class='list-group-item' title='Orders'"}
                        {elseif $current_user['user_role'] eq 'Admin'}
                            {url type="anchor" url="admin/orders" text=lang("sidebar/orders") attr="class='list-group-item' title='Orders'"}
                            {url type="anchor" url="admin/disputes" text=lang("sidebar/disputes") attr="class='list-group-item' title='Disputes'"}
                        {elseif $current_user['user_role'] eq 'Buyer'}
                            {url type="anchor" url="purchases" text=lang("sidebar/my_purchases") attr="class='list-group-item' title='Your Purchases'"}
                        {/if}
                    </div>
                    {/if}

                    {if $category_data.block eq FALSE}
                        <noscript>
                            <div class="well sidebar-nav">
                                <ul class="nav nav-list">
                                    <li class="nav-header">{lang('sidebar/categories')}</li>
                                    {$category_data.cats}
                                </ul>
                            </div>
                        </noscript>
                        <div class="jsmenu">
                            <div id="tree-menu" class="nojs"></div>
                        </div>
                    {/if}
                </div>
            </div>
