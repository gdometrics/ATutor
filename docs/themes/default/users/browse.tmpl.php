<?php require(AT_INCLUDE_PATH.'header.inc.php'); ?>

<div id="browse">
	<div style="float: left; white-space:nowrap; padding-right:30px;">
			<h3><?php echo _AT('cats_categories'); ?></h3>

			<ul class="browse-list">
				<?php 
				foreach ($this->cats as $cat_id => $cat_name): 
					if ($cat_id == $this->cat): ?>
						<div class="browse-selected">
					<?php else: ?>
						<div class="browse-unselected">
					<?php endif; ?>
							<li><a href="<?php echo $_SERVER['PHP_SELF'].'?cat='.$cat_id; ?>#courses"><?php echo $cat_name ?></a></li>    
						</div>
				<?php endforeach; ?>		
			</ul>			<br />

	</div>
	<a name="courses"></a>
	<div style="float: left; white-space:nowrap; padding-right:30px;">
			<h3><?php echo $this->cats[$this->cat].' '._AT('courses'); ?></h3>

			<?php if (isset($this->courses)):
				$cur_sub_cat = ''; ?>

				<ul class="browse-list">
					<?php if ($this->course == 0): ?>
						<div class="browse-selected">
					<?php else: ?>
						<div class="browse-unselected">
					<?php endif; ?>
						<li><a href="browse.php?cat=0<?php echo SEP;?>course=0#info"><?php echo _AT('browse_all_courses'); ?></a></li>
					</div>			
					
					<?php foreach ($this->courses as $course_id=>$info):
						if (isset($this->sub_cats) && array_key_exists($info['cat_id'], $this->sub_cats) && ($cur_sub_cat != $this->sub_cats[$info['cat_id']])):
							$cur_sub_cat = $this->sub_cats[$info['cat_id']];?>
							</ul><br /><h4><?php echo $cur_sub_cat; ?></h4><ul class="browse-list">
						<?php endif; ?>

						<?php if ($info['selected']): ?>
							<div class="browse-selected">
						<?php else: ?>
							<div class="browse-unselected">
						<?php endif; ?>
							<li><a href="<?php echo $info['url']; ?>"><?php echo $info['title']; ?></a></li>
						</div>

					<?php endforeach; ?>
				</ul>
			<?php else:
				echo _AT('no_courses');
			endif;?>
			<br />
	</div>

	<div style="float: left; width: 30%;">
	<?php foreach ($this->course_row as $this->course_row): ?>
		<a name="info"></a>
		<div>
				<h3 style="clear: none;	display:inline;"><?php echo $this->course_row['title']; ?></h3>&nbsp;- <a href="bounce.php?course=<?php echo $this->course_row['course_id']; ?>"><?php echo _AT('enter_course'); ?></a>
				<p><?php echo $this->course_row['description']; ?></p>
				<p><?php echo _AT('instructor').': '. $this->course_row['login']; ?><br />
				<?php echo _AT('access').': '.$this->course_row['access']; ?></p>

				<br />
		</div>
	<?php endforeach; ?>
	</div>
</div>
<br />

<?php require(AT_INCLUDE_PATH.'footer.inc.php'); ?>