import { Button, Typography, TypographyProps } from "@mui/material";
import { ReactNode } from "react";

type Props = {
  text?: string;
  buttonProps?: any;
  children?: ReactNode;
  textProps?: TypographyProps;
};

export const ButtonCommon = (props: Props) => {
  const { text, children, textProps, buttonProps } = props;
  return (
    <Button color="primary" {...buttonProps}>
      {children ?? <Typography {...textProps}>{text}</Typography>}
    </Button>
  );
};
