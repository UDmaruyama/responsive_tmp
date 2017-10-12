<h2>新着情報</h2>

<form method="get" action="" name="frm_order1" class="frm_order">
<select name="max_col" onchange="frm_order1.submit();">
<option value="10" <?=($this->max_cols==10)?'selected="selected"':'';?>>10件表示</option>
<option value="20" <?=($this->max_cols==20)?'selected="selected"':'';?>>20件表示</option>
<option value="50" <?=($this->max_cols==50)?'selected="selected"':'';?>>50件表示</option>
<option value="100" <?=($this->max_cols==100)?'selected="selected"':'';?>>100件表示</option>
</select>
<input name="p" value="<?=$this->p + 1?>" type="hidden"/>
</form>

<ul class="news_list">
<? foreach($this->list as $i=>$v){ ?>
<?
	$link = $v->n_mimg_link;
    //-- リンクなし
    //if(!$link){
        if($v->n_comment||$v->n_mimg_src){
            $link = 'news.php?id='.$v->n_id;
            $v->n_new = 0;
        }
    //}
?>
	<li class="news">
		<a id="news<?=($v->n_id);?>"></a>
		<span class="date"><?=date('Y年m月d日',strtotime($v->n_date));?></span>
		<span class="title">
			<? if($link){ ?><a <?=$v->n_new?' target="_blank"':'';?> href="<?=$link;?>"><? } ?>
			<?=htmlspecialchars($v->n_title);?>
			<? if($link){ ?></a><? } ?>
		</span>
		<div style="clear:both;"><!-- --></div>
	</li>
<? } ?>
</ul>

<form method="get" action="" name="frm_order2" class="frm_order">
<select name="max_col" onchange="frm_order2.submit();">
<option value="10" <?=($this->max_cols==10)?'selected="selected"':'';?>>10件表示</option>
<option value="20" <?=($this->max_cols==20)?'selected="selected"':'';?>>20件表示</option>
<option value="50" <?=($this->max_cols==50)?'selected="selected"':'';?>>50件表示</option>
<option value="100" <?=($this->max_cols==100)?'selected="selected"':'';?>>100件表示</option>
</select>
<input name="p" value="<?=$this->p + 1?>" type="hidden"/>
</form>
<?=$this->pager('index.php',$this->p ,$this->total);?>