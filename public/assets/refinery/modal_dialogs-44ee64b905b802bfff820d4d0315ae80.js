init_modal_dialogs=function(){$('a[href*="dialog=true"]').not("#dialog_container a").each(function(e,t){$(t).data({"dialog-width":parseInt($($(t).attr("href").match("width=([0-9]*)")).last().get(0),10)||928,"dialog-height":parseInt($($(t).attr("href").match("height=([0-9]*)")).last().get(0),10)||473,"dialog-title":$(t).attr("title")||$(t).attr("name")||$(t).html()||null}).attr("href",$(t).attr("href").replace(/(&(amp;)?|\?)(dialog=true|(width|height)=\d+)/g,"").replace(/(\/[^&\?]*)&(amp;)?/,"$1?")).click(function(e){$anchor=$(this),iframe_src=(iframe_src=$anchor.attr("href"))+(iframe_src.indexOf("?")>-1?"&":"?")+"app_dialog=true&dialog=true",iframe=$("<iframe id='dialog_iframe' frameborder='0' marginheight='0' marginwidth='0' border='0'></iframe>"),$.browser.msie||iframe.corner("8px"),iframe.dialog({title:$anchor.data("dialog-title"),modal:!0,resizable:!1,autoOpen:!0,width:$anchor.data("dialog-width"),height:$anchor.data("dialog-height"),open:onOpenDialog,close:onCloseDialog}),iframe.attr("src",iframe_src),e.preventDefault()})})},init_sortable_menu=function(){var e=$("#menu");0!==e.length&&(e.sortable({axis:"x",cursor:"crosshair",connectWith:".nested",update:function(){$.post("/refinery/update_menu_positions",e.sortable("serialize",{key:"menu[]",expression:/plugin_([\w]*)$/}))}}).tabs(),e.sortable("disable"),e.find("#menu_reorder").click(function(e){trigger_reordering(e,!0)}),e.find("#menu_reorder_done").click(function(e){trigger_reordering(e,!1)}),e.find("> a").corner("top 5px"))},trigger_reordering=function(e,t){e.preventDefault(),$("#menu_reorder, #menu_reorder_done").toggle(),$("#site_bar, #content").fadeTo(500,t?.35:1),t?$menu.find(".tab a").click(function(e){e.preventDefault()}):$menu.find(".tab a").unbind("click"),$menu.sortable(t?"enable":"disable")},init_submit_continue=function(){$("#submit_continue_button").click(submit_and_continue),$("form").change(function(){$(this).attr("data-changes-made",!0)}),(continue_editing_button=$("#continue_editing")).length>0&&"no-prompt"!=continue_editing_button.attr("rel")&&$("#editor_switch a").click(function(e){$("form[data-changes-made]").length>0&&(confirm("translation missing: ru.js.admin.confirm_changes")||e.preventDefault())})},submit_and_continue=function(e,t){$(this).hasClass("wymupdate")&&$.each(WYMeditor.INSTANCES,function(e,t){t.update()}),$("#continue_editing").val(!0),$("#flash").fadeOut(250),$(".fieldWithErrors").removeClass("fieldWithErrors").addClass("field"),$("#flash_container .errorExplanation").remove(),$.post($("#continue_editing").get(0).form.action,$($("#continue_editing").get(0).form).serialize(),function(e){($flash_container=$("#flash_container")).length>0&&($flash_container.html(e),$("#flash").css({width:"auto",visibility:null}).fadeIn(550),$(".errorExplanation").not($("#flash_container .errorExplanation")).remove(),null!=(error_fields=$("#fieldsWithErrors").val())?$.each(error_fields.split(","),function(){$("#"+this).wrap("<div class='fieldWithErrors' />")}):t&&(window.location=t),$(".fieldWithErrors:first :input:first").focus(),$("#continue_editing").val(!1),init_flash_messages())}),e.preventDefault()};