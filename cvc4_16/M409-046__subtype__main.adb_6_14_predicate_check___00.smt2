;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (positive positive) Bool)

(declare-const dummy positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range
                                    temp___expr_46)))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort positive_with_hole 0)

(declare-fun positive_with_holeqtint (positive_with_hole) Int)

;; positive_with_hole'axiom
  (assert
  (forall ((i positive_with_hole))
  (and (<= 1 (positive_with_holeqtint i))
  (<= (positive_with_holeqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (positive_with_hole positive_with_hole) Bool)

(declare-const dummy1 positive_with_hole)

(declare-datatypes ((positive_with_hole__ref 0))
(((positive_with_hole__refqtmk
  (positive_with_hole__content positive_with_hole)))))
(define-fun positive_with_hole__ref_positive_with_hole__content__projection ((a positive_with_hole__ref)) positive_with_hole 
  (positive_with_hole__content a))

(define-fun dynamic_invariant1 ((temp___expr_180 Int)
  (temp___is_init_176 Bool) (temp___skip_constant_177 Bool)
  (temp___do_toplevel_178 Bool)
  (temp___do_typ_inv_179 Bool)) Bool (and
                                     (=>
                                     (or (= temp___is_init_176 true)
                                     (<= 1 2147483647)) (in_range1
                                     temp___expr_180))
                                     (=> (= temp___do_toplevel_178 true)
                                     (=> (= temp___is_init_176 true)
                                     (or
                                     (and (<= 1 temp___expr_180)
                                     (<= temp___expr_180 9))
                                     (and (<= 21 temp___expr_180)
                                     (<= temp___expr_180 2147483647)))))))

(define-fun dynamic_predicate ((temp___184 Int)) Bool (or
                                                      (and (<= 1 temp___184)
                                                      (<= temp___184 9))
                                                      (and (<= 21 temp___184)
                                                      (<= temp___184 2147483647))))

(assert
;; defqtvc
 ;; File "main.adb", line 3, characters 0-0
  (not
  (forall ((v Int))
  (=> (= v 12)
  (=> (dynamic_invariant v true false true true)
  (or (and (<= 1 v) (<= v 9)) (and (<= 21 v) (<= v 2147483647))))))))
(check-sat)