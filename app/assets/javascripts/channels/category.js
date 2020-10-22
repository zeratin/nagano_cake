/*global$*/(function(){
  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChildrenBox(insertHTML){
    var childSelectHtml = "";
    childSelectHtml = `<div class="category__child" id="children_wrapper">
                        <select id="child__category" name="item[category_id]" class="serect_field">
                          <option value="">---</option>
                          ${insertHTML}
                        </select>
                      </div>`;
  /*global$*/('.append__category').append(childSelectHtml);
  }
  function appendGrandchildrenBox(insertHTML){
    var grandchildSelectHtml = "";
    grandchildSelectHtml = `<div class="category__child" id="grandchildren_wrapper">
                              <select id="grandchild__category" name="item[category_id]" class="serect_field">
                                <option value="">---</option>
                                ${insertHTML}
                                </select>
                            </div>`;
  /*global$*/('.append__category').append(grandchildSelectHtml);
  }

  /*global$*/('#item_category_id').on('change',function(){
    var parentId = document.getElementById('item_category_id').value;
    if (parentId != ""){
      /*global.ajax*/({
        url: '/items/get_category_children/',
        type: 'GET',
        data: { parent_id: parentId },
        dataType: 'json'
      })
      .done(function(children){
        /*global$*/('#children_wrapper').remove();
        /*global$*/('#grandchildren_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      });
    }else{
      /*global$*/('#children_wrapper').remove();
      /*global$*/('#grandchildren_wrapper').remove();
    }
  });
  /*global$*/('.append__category').on('change','#child__category',function(){
    var childId = document.getElementById('child__category').value;
    if(childId != "" && childId != 46 && childId != 74 && childId != 134 && childId != 142 && childId != 147 && childId != 150 && childId != 158){
      /*global.ajax*/({
        url: '/items/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        /*global$*/('#grandchildren_wrapper').remove();
        var insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendGrandchildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      });
    }else{
      /*global$*/('#grandchildren_wrapper').remove();
    }
  });
});
