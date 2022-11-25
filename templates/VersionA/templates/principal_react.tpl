<!doctype html><html lang="en"><head>
    <meta charset="utf-8"/>
    <link rel="shortcut icon" href="favicon.ico"><meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no"/>
    <meta name="theme-color" content="#000000"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
    <link href="https://fonts.googleapis.com/css?family=Titillium+Web:300,400,700" rel="stylesheet">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css"/>
    <link rel="manifest" href="ReactCalendar/manifest.json"><link rel="data" href="data.json">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <title>Calendrier d'Alaxione</title>
    <link href="ReactCalendar/static/css/2.52927da6.chunk.css" rel="stylesheet">
    <link href="ReactCalendar/static/css/main.7b3bca38.chunk.css" rel="stylesheet"></head><body><div id="root"></div>
<script src="https://unpkg.com/react@16.0.0/umd/react.production.min.js"></script>
{if isset($pagedirection)}
    {if $pagedirection|is_array}
        {foreach from=$pagedirection item=tpl}
            {include file="$tpl"}
        {/foreach}
    {else}
        {include file="$pagedirection"}
    {/if}
{/if}