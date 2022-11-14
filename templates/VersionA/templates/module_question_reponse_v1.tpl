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

{literal}

    <style type="text/css">
        .flowchart-alx{
            height: 600px;
            border: 1px solid #BBB;
            margin-bottom: 10px;
        }
    </style>
    <link href="css/jquery.flowchart.min.css" rel="stylesheet" type="text/css">

    <script src="js/raphael-min.js"></script>
    <script src="js/flowchart.min.js"></script>
    <script src="js/jquery.flowchart.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            var data = {
                operators: {
                    operator1: {
                        top: 20,
                        left: 20,
                        properties: {
                            title: 'Question 1',
                            inputs: {},
                            outputs: {
                                output_1: {
                                    label: 'Oui',
                                },
                                output_2: {
                                    label: 'Non',
                                }
                            }
                        }
                    },
                    operator2: {
                        top: 20,
                        left: 300,
                        properties: {
                            title: 'Question 2',
                            inputs: {
                                input_1: {
                                    label: '',
                                },
                            },
                            outputs: {
                                output_1: {
                                    label: 'Choix 1',
                                },
                                output_2: {
                                    label: 'Choix 2',
                                },
                                output_3: {
                                    label: 'Choix 3',
                                }
                            }
                        }
                    },
                    operator3: {
                        top: 20,
                        left: 580,
                        properties: {
                            title: 'Fin',
                            inputs: {
                                input_1: {
                                    label: 'Valide',
                                },
                            },
                            outputs: {}
                        }
                    },
                    operator4: {
                        top: 120,
                        left: 580,
                        properties: {
                            title: 'Fin',
                            inputs: {
                                input_1: {
                                    label: 'Non valide',
                                },
                                input_2: {
                                    label: 'Non valide',
                                },
                            },
                            outputs: {}
                        }
                    },
                    operator5: {
                        top: 180,
                        left: 20,
                        properties: {
                            title: 'Question 3',
                            inputs: {},
                            outputs: {
                                output_1: {
                                    label: 'Oui',
                                },
                                output_2: {
                                    label: 'Non',
                                }
                            }
                        }
                    },
                },
                links: {
                    link_1: {
                        fromOperator: 'operator1',
                        fromConnector: 'output_1',
                        toOperator: 'operator2',
                        toConnector: 'input_1',
                    },
                    link_2: {
                        fromOperator: 'operator2',
                        fromConnector: 'output_1',
                        toOperator: 'operator3',
                        toConnector: 'input_1',
                    },
                    link_3: {
                        fromOperator: 'operator2',
                        fromConnector: 'output_2',
                        toOperator: 'operator4',
                        toConnector: 'input_1',
                    },
                    link_4: {
                        fromOperator: 'operator5',
                        fromConnector: 'output_1',
                        toOperator: 'operator4',
                        toConnector: 'input_2',
                    },
                }
            };

            var $operatorProperties = $('#operator_properties');
            var $linkProperties = $('#link_properties');
            var $operatorTitle = $('#operator_title');
            var $linkColor = $('#link_color');

            // Apply the plugin on a standard, empty div...
            var $flowchart = $('#sequence_1');
            $flowchart.flowchart({
                data: data,
                onOperatorSelect: function(operatorId) {
                    $operatorProperties.show();
                    $operatorTitle.val($flowchart.flowchart('getOperatorTitle', operatorId));
                    return true;
                },
                onOperatorUnselect: function() {
                    $operatorProperties.hide();
                    return true;
                },
                onLinkSelect: function(linkId) {
                    $linkProperties.show();
                    $linkColor.val($flowchart.flowchart('getLinkMainColor', linkId));
                    return true;
                },
                onLinkUnselect: function() {
                    $linkProperties.hide();
                    return true;
                }
            });

            $operatorTitle.keyup(function() {
                var selectedOperatorId = $flowchart.flowchart('getSelectedOperatorId');
                if (selectedOperatorId != null) {
                    $flowchart.flowchart('setOperatorTitle', selectedOperatorId, $operatorTitle.val());
                }
            });

            $linkColor.change(function() {
                var selectedLinkId = $flowchart.flowchart('getSelectedLinkId');
                if (selectedLinkId != null) {
                    $flowchart.flowchart('setLinkMainColor', selectedLinkId, $linkColor.val());
                }
            });

            var operatorI = 0;
            $flowchart.siblings('.create_operator').click(function() {
                var operatorId = 'created_operator_' + operatorI;
                var operatorData = {
                    top: 60,
                    left: 500,
                    properties: {
                        title: 'Operator ' + (operatorI + 3),
                        inputs: {
                            input_1: {
                                label: 'Input 1',
                            }
                        },
                        outputs: {
                            output_1: {
                                label: 'Output 1',
                            }
                        }
                    }
                };

                operatorI++;

                $flowchart.flowchart('createOperator', operatorId, operatorData);
            });

            $flowchart.siblings('.delete_selected_button').click(function() {
                $flowchart.flowchart('deleteSelected');
            });

            $flowchart.siblings('.get_data').click(function() {
                var data = $flowchart.flowchart('getData');
                $('#flowchart_data').val(JSON.stringify(data, null, 2));
            });

            $flowchart.siblings('.set_data').click(function() {
                var data = JSON.parse($('#flowchart_data').val());
                $flowchart.flowchart('setData', data);
            });
        });
    </script>

{/literal}

<div class="vd_title-section clearfix">
    <div class="vd_panel-header">
        <h1>{$sTitreListe}</h1>
    </div>
</div>

<div class="vd_content-section clearfix" style="min-height: 900px">
    <div class="panel widget light-widget">
        <div class="panel-body">
            <div class="flowchart-alx flowchart-container" id="sequence_1"></div>
            <div id="operator_properties" style="display: none;">
                <label for="operator_title">Question : </label><input type="text" id="operator_title">
            </div>
            <div id="link_properties" style="display: none;">
                <label for="link_color">Couleur du lien : </label><input type="color" id="link_color">
            </div>

            {*
            <div id="diagram"></div>
            {literal}
            <script>
                var diagram = flowchart.parse('st=>start: Début\n' +
                'e=>end: Fin\n' +
                'op1=>operation: Question 1:>javascript:onclick(alert(\'On ouvre la modal pour modifier la question\'));\n' +
                'cond=>condition: Oui ou Non\n' +
                'op2=>operation: Question 2:>javascript:onclick(alert(\'On ouvre la modal pour modifier la question\'));\n' +
                'cond2=>condition: Oui ou Non\n' +
                'io=>inputoutput: La réponse est validé\n' +
                'io2=>inputoutput: La réponse est validé\n' +
                'st->op1->cond\n' +
                'cond(yes)->io->e\n' +
                'cond(no)->op2->cond2(yes)->io2->e');

                diagram.drawSVG('diagram');

                // you can also try to pass options:

                diagram.drawSVG('diagram', {
                    'x': 0,
                    'y': 0,
                    'line-width': 3,
                    'line-length': 50,
                    'text-margin': 10,
                    'font-size': 14,
                    'font-color': 'black',
                    'line-color': 'black',
                    'element-color': 'black',
                    'fill': 'white',
                    'yes-text': 'Oui',
                    'no-text': 'Non',
                    'arrow-end': 'block',
                    'scale': 1,
                    // style symbol types
                    'symbols': {
                        'start': {
                            'font-color': 'red',
                            'element-color': 'green',
                            'fill': 'yellow'
                        },
                        'end':{
                            'class': 'end-element'
                        }
                    },
                    // even flowstate support ;-)
                    'flowstate' : {
                        // 'past' : { 'fill' : '#CCCCCC', 'font-size' : 12},
                        // 'current' : {'fill' : 'yellow', 'font-color' : 'red', 'font-weight' : 'bold'},
                        // 'future' : { 'fill' : '#FFFF99'},
                        'request' : { 'fill' : 'blue'},
                        // 'invalid': {'fill' : '#444444'},
                        'approved' : { 'fill' : '#58C4A3', 'font-size' : 12, 'yes-text' : 'Oui', 'no-text' : 'Non' }
                        // 'rejected' : { 'fill' : '#C45879', 'font-size' : 12, 'yes-text' : 'n/a', 'no-text' : 'REJECTED' }
                    }
                });
            </script>
            {/literal}
        </div>*}
        <!-- panel-body  -->

    </div>
    <!-- panel -->

</div>