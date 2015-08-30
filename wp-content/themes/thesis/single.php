<?php get_header(); ?>
<section class="inner_page">
	<div class="container page">
		<div class="row">
			<?php while ( have_posts() ) : the_post(); ?>
					<h1 class="text-center"><?php the_title();?></h1>
					<?php the_content(); ?>
					<?php get_template_part( 'content' ); ?>
			<?php endwhile; // end of the loop. ?>
		</div>
	</div>
</section>
<?php get_footer(); ?>