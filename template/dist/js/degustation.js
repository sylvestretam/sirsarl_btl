function showDegustation(degustation_id)
{
    const degustation = degustations.find(element=> element.degustation_id == degustation_id);
    
    $('.degustation_id').val(degustation_id);
    $('.date_degustation').val(degustation.date_degustation);
    $('.market_develloper').val(degustation.market_develloper);

    let text ="";
    
    (degustation.lignes).forEach(element => {
        let txt = 
            `<tr id="${element.article}">
                <td> ${element.article} </td>
                <td> ${element.quantite} </td>
                <td> ${element.unite} </td>
                <td> ${element.valeur} </td>
            </tr>`;
        text = text.concat(txt); 
    });
    
    $('.lignedegustation').html(text);

    back('.sect_list','.sect_mod');
}


let LIGNES_DEGUSTATIONS = {};

function addLigneDegustation()
{
    let article = $('#article').val();
    let quantite = $('#quantite').val();
    let unite = $('#unite').val();
    let valeur = $('#valeur').val();

    if(article =="" || quantite == "" || unite =="" || valeur == "")
    {
        $('.txt_message_error').html("Veuillez remplir tous les champs");
        $('.sect_error').removeClass('invisible');
    }
    else
    {
        LIGNES_DEGUSTATIONS[article] = {"quantite":quantite,"unite":unite,"valeur":valeur};
        $('.ligne_degustation').val( JSON.stringify(LIGNES_DEGUSTATIONS) );
        writeLigneDegustation(LIGNES_DEGUSTATIONS,'.lignedegustation');
    }
}

function removeLigneDegustation(idligne)
{
    $(`#${idligne}`).addClass("invisible");
    delete LIGNES_DEGUSTATIONS[idligne];
    if( Object.keys(LIGNES_DEGUSTATIONS).length > 0)
        $('.ligne_degustation').val( JSON.stringify(LIGNES_DEGUSTATIONS) );
    else
        $('.ligne_degustation').val( "" );   
}

function writeLigneDegustation(lignes,tbody)
{
    let text ="";
    for (const element in lignes) {
        let txt = 
            `<tr id="${element}">
                <td> ${element} </td>
                <td> ${lignes[element].quantite} </td>
                <td> ${lignes[element].unite} </td>
                <td> ${lignes[element].valeur} </td>
                <td> 
                    <button type="button" onclick="removeLigneDegustation('${element}')"> 
                        <i class="fas fa-trash" aria-hidden="true"></i> 
                    </button>
                </td>
            </tr>`;
        text = text.concat(txt); 
    }
    
    $(tbody).html(text);
}