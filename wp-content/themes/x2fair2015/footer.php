	<footer>
		<div class="container">
			<div class="row">
				&copy; <?php  echo '<a href="'.esc_url(home_url('/')).'">'.get_bloginfo('name')."</a>"; echo ' ';  echo date('Y');?>
			</div>
		</div>
	</footer>
	<?php wp_footer(); ?>
</body>
</html>