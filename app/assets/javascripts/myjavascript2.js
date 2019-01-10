  function getData(data) {
    var p1 = data.replace('[', "");
    var p2 = p1.replace(']', "");
    p1 = p2.replace(/"/g, "");
    p2 = p1.replace(/,/g, "");
    var data_array = p2.split(" ");
    data_array.shift();
    data_array.pop();
    return data_array;
  }

  function replaceStars(data) {
    var data_array = [];
    var data_str = ' ';
    var data_str2 = ' ';
    var i = 0;
    var datalength = data.length;
    for (i = 0; i < datalength; i++) {
      data_str = data[i].replace('*', ', ')
      data_str2 = data_str.replace('~', ' ')
      data_array.push(data_str2);
    }
    return data_array;
  }

  function skuLists() {
    //******* need to match customer to csr and day
    var skus = document.getElementById("skus").innerHTML;
    var regions = document.getElementById("regions").innerHTML;
    var subregions = document.getElementById("subregions").innerHTML;
    var cbsas = document.getElementById("cbsas").innerHTML;
    var sku_array = getData(skus);
    var data_array = getData(regions);
    var region_array = replaceStars(data_array);
    data_array = getData(subregions);
    var subregion_array = replaceStars(data_array);
    data_array = getData(cbsas);
    var cbsa_array = replaceStars(data_array);
    var sku_list = document.getElementById("sku");
    var sku = sku_list.options[sku_list.selectedIndex].text;
    var region_list = document.getElementById("region");
    var region = region_list.options[region_list.selectedIndex].text;
    var subregionlength = subregion_array.length;
    var subregion = document.getElementById("subregion");
    var subregion_id = ' ';
    var o = document.createElement("option");
    var sortarray = [];
    var i = 0;
    subregion.options.length = 0;
    for (i = 0; i < subregionlength; i++) {
      if (sku_array[i] == sku && (region == '' || region_array[i] == region)) {
        if (sortarray.includes(subregion_array[i]) == false) {
          sortarray[sortarray.length] = subregion_array[i];
        }
      }
    }
    sortarray.sort();
    var sortlength = sortarray.length;
    o.selected = true;
    subregion_id = sortarray[0];
    for (i = 0; i < sortlength; i++) {
      o.text = sortarray[i];
      subregion.options.add(o, subregion.options.length);
      o.selected = false;
      o = document.createElement("option");
    }

    var cbsa = document.getElementById("cbsa");
    o = document.createElement("option");
    sortarray = [];
    i = 0;
    cbsa.options.length = 0;

    for (i = 0; i < subregionlength; i++) {
      if (sku_array[i] == sku && region_array[i] == region && (subregion_id == '' || subregion_array[i] == subregion_id)) {
        if (sortarray.includes(cbsa_array[i]) == false) {
          sortarray[sortarray.length] = cbsa_array[i];
        }
      }
    }
    sortarray.sort();
    var sortlength = sortarray.length;

    for (i = 0; i < sortlength; i++) {
      o.text = sortarray[i];
      cbsa.options.add(o, cbsa.options.length);
      o = document.createElement("option");
    }
  }

  function cbsas() {
    //******* need to match shipto to customer
    var skus = document.getElementById("skus").innerHTML;
    var regions = document.getElementById("regions").innerHTML;
    var subregions = document.getElementById("subregions").innerHTML;
    var cbsas = document.getElementById("cbsas").innerHTML;
    var sku_array = getData(skus);
    var region_array = getData(regions);
    var subregion_array = getData(subregions);
    var cbsa_array = getData(cbsas);
    var sku_list = document.getElementById("sku");
    var sku = sku_list.options[sku_list.selectedIndex].text;
    var region_list = document.getElementById("region");
    var region = region_list.options[region_list.selectedIndex].text;
    var subregion_list = document.getElementById("subregion");
    var subregion = subregion_list.options[subregion_list.selectedIndex].text;
    var subregionlength = subregion_array.length;
    var cbsa = document.getElementById("cbsa");
    o = document.createElement("option");
    sortarray = [];
    i = 0;
    cbsa.options.length = 0;

    for (i = 0; i < subregionlength; i++) {
      if (sku_array[i] == sku && region_array[i] == region && subregion_array[i] == subregion) {
        if (sortarray.includes(cbsa_array[i]) == false) {
          sortarray[sortarray.length] = cbsa_array[i];
        }
      }
    }
    sortarray.sort();
    var sortlength = sortarray.length;

    for (i = 0; i < sortlength; i++) {
      o.text = sortarray[i];
      cbsa.options.add(o, cbsa.options.length);
      o = document.createElement("option");
    }
  }
