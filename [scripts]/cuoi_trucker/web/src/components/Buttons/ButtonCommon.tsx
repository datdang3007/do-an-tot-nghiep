import { Button, Typography, TypographyProps } from "@mui/material";

type Props = {
  text: string;
  buttonProps?: any;
  textProps?: TypographyProps;
};

export const ButtonCommon = (props: Props) => {
  const { text, textProps, buttonProps } = props;
  return (
    <Button color="primary" {...buttonProps}>
      <Typography {...textProps}>{text}</Typography>
    </Button>
  );
};
