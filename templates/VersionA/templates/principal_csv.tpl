
           <!--ici include tpl -->
           {if isset($pagedirection)}
            {if $pagedirection|is_array}
              {foreach from=$pagedirection item=tpl}
                {include file="$tpl"}
              {/foreach}
            {else}
              {include file="$pagedirection"}
            {/if}
          {/if}

