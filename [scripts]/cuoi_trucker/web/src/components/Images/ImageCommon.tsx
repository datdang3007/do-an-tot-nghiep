import { Box, BoxProps, styled } from "@mui/material";

type Props = {
  src: string;
  imageProps?: any;
  boxProps?: BoxProps;
};

export const ImageCommon = (props: Props) => {
  const { src, boxProps, imageProps } = props;
  return (
    <BoxStyle {...boxProps}>
      <ImageStyle src={src} alt={src} {...imageProps} />
    </BoxStyle>
  );
};

const BoxStyle = styled(Box)({
  width: "100%",
  height: "100%",
});

const ImageStyle = styled("img")({
  display: "block",
  width: "100%",
  height: "100%",
  objectFit: "cover",
});
