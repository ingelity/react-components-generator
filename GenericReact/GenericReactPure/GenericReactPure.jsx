import React from 'react';
import classnames from 'classnames';
import styles from './GenericReactPureStyles.scss';

const GenericReactPure = props => {
  const containerClassName = classnames(props.className, styles.dotItem, {
    [styles['dotItem--isClickable']]: props.onClick,
  });

  return (
    <div onClick={props.onClick} className={containerCassName}>
      {props.content}
    </div>
  );
};

GenericReactPure.propTypes = {
  className: React.PropTypes.string,
  content: React.PropTypes.string.isRequired,
  onClick: React.PropTypes.func,
};

export default GenericReactPure;
