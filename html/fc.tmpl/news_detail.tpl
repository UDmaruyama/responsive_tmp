<?
	$link = $this->dat->n_mimg_link;
	$src = $this->dat->n_mimg_src;
	$alt = $this->dat->n_mimg_alt;
?>

<div class="date"><?=date('Y年m月d日',strtotime($this->dat->n_date));?></div>
<h2 class="title"><?=nl2br(htmlspecialchars($this->dat->n_title));?></h2>
<br />
<div class="s">
	<? if($src){ ?>
	<img src="../fc.img/<?=$src;?>" alt="<?=$alt;?>" border="0" class="newsimg" />
	<? } ?>
	<div class="comment">
		<?=nl2br(htmlspecialchars(str_replace('\\r',"",$this->dat->n_comment)));?>
	</div>
	<? if($link){ ?>
	<div class="link">
		<span>関連リンク：</span>
		<a <?=$this->dat->n_new?'target="_blank"':'';?> href="<?=$link;?>"><?=$link;?></a>
	</div>
	<? } ?>
</div>
