part of '../detail_page.dart';

class _BackdropImage extends StatelessWidget {
  const _BackdropImage({
    required this.film,
    required this.onLinkPressed,
  });

  final FilmDetailModel film;
  final VoidCallback onLinkPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: 'movie_${film.id}', 
          child: ProjectCachedImage(
            imageUrl: film.backdropPath,
            height: context.dynamicHeight(0.32),
            width: context.dynamicWidth(1),
            withShadow: false,
            isBackdrop: true,
          ),
        ),
        Positioned(
          top: context.dynamicHeight(0.13),
          left: context.dynamicWidth(0.45),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: RadiusValue.medium.value,
            child: IconButton(
              onPressed: onLinkPressed,
              icon: const Icon(
                Icons.link_outlined,
                color: ProjectColors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}