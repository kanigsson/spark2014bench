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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun to_rep ((x positive)) Int (positiveqtint x))

(declare-fun of_rep (Int) positive)

;; inversion_axiom
  (assert
  (forall ((x positive))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x positive)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-const c Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun to_rep1 ((x natural)) Int (naturalqtint x))

(declare-fun of_rep1 (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                             (of_rep1 x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__with_default__bad_nested_defaults1__empty_rec__d positive)))))
(define-fun us_split_discrs_rec__with_default__bad_nested_defaults1__empty_rec__d__projection ((a us_split_discrs)) positive 
  (rec__with_default__bad_nested_defaults1__empty_rec__d a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__9__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_discrs1 us_split_discrs)))))
(define-fun us_rep___split_discrs__9__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__with_default__bad_nested_defaults1__empty_rec__d
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__with_default__bad_nested_defaults1__empty_rec__d
                                                  (us_split_discrs1 b))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const with_default__bad_nested_defaults1__empty_rec__d__first__bit Int)

(declare-const with_default__bad_nested_defaults1__empty_rec__d__last__bit Int)

(declare-const with_default__bad_nested_defaults1__empty_rec__d__position Int)

;; with_default__bad_nested_defaults1__empty_rec__d__first__bit_axiom
  (assert
  (<= 0 with_default__bad_nested_defaults1__empty_rec__d__first__bit))

;; with_default__bad_nested_defaults1__empty_rec__d__last__bit_axiom
  (assert
  (< with_default__bad_nested_defaults1__empty_rec__d__first__bit with_default__bad_nested_defaults1__empty_rec__d__last__bit))

;; with_default__bad_nested_defaults1__empty_rec__d__position_axiom
  (assert (<= 0 with_default__bad_nested_defaults1__empty_rec__d__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((empty_rec__ref 0))
(((empty_rec__refqtmk (empty_rec__content us_rep)))))
(define-fun empty_rec__ref_empty_rec__content__projection ((a empty_rec__ref)) us_rep 
  (empty_rec__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__with_default__bad_nested_defaults1__non_init__e us_rep)(rec__with_default__bad_nested_defaults1__non_init__f natural)))))
(define-fun us_split_fields_rec__with_default__bad_nested_defaults1__non_init__e__projection ((a us_split_fields)) us_rep 
  (rec__with_default__bad_nested_defaults1__non_init__e a))

(define-fun us_split_fields_rec__with_default__bad_nested_defaults1__non_init__f__projection ((a us_split_fields)) natural 
  (rec__with_default__bad_nested_defaults1__non_init__f a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__11__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__11__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (bool_eq
                            (rec__with_default__bad_nested_defaults1__non_init__e
                            (us_split_fields1 a))
                            (rec__with_default__bad_nested_defaults1__non_init__e
                            (us_split_fields1 b))) true)
                         (= (to_rep1
                            (rec__with_default__bad_nested_defaults1__non_init__f
                            (us_split_fields1 a))) (to_rep1
                                                   (rec__with_default__bad_nested_defaults1__non_init__f
                                                   (us_split_fields1 b)))))
                    true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const with_default__bad_nested_defaults1__non_init__e__first__bit Int)

(declare-const with_default__bad_nested_defaults1__non_init__e__last__bit Int)

(declare-const with_default__bad_nested_defaults1__non_init__e__position Int)

;; with_default__bad_nested_defaults1__non_init__e__first__bit_axiom
  (assert (<= 0 with_default__bad_nested_defaults1__non_init__e__first__bit))

;; with_default__bad_nested_defaults1__non_init__e__last__bit_axiom
  (assert
  (< with_default__bad_nested_defaults1__non_init__e__first__bit with_default__bad_nested_defaults1__non_init__e__last__bit))

;; with_default__bad_nested_defaults1__non_init__e__position_axiom
  (assert (<= 0 with_default__bad_nested_defaults1__non_init__e__position))

(declare-const with_default__bad_nested_defaults1__non_init__f__first__bit Int)

(declare-const with_default__bad_nested_defaults1__non_init__f__last__bit Int)

(declare-const with_default__bad_nested_defaults1__non_init__f__position Int)

;; with_default__bad_nested_defaults1__non_init__f__first__bit_axiom
  (assert (<= 0 with_default__bad_nested_defaults1__non_init__f__first__bit))

;; with_default__bad_nested_defaults1__non_init__f__last__bit_axiom
  (assert
  (< with_default__bad_nested_defaults1__non_init__f__first__bit with_default__bad_nested_defaults1__non_init__f__last__bit))

;; with_default__bad_nested_defaults1__non_init__f__position_axiom
  (assert (<= 0 with_default__bad_nested_defaults1__non_init__f__position))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((non_init__ref 0))
(((non_init__refqtmk (non_init__content us_rep1)))))
(define-fun non_init__ref_non_init__content__projection ((a non_init__ref)) us_rep1 
  (non_init__content a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun default_initial_assumption ((temp___expr_594 us_rep1)
  (temp___skip_top_level_595 Bool)) Bool (= (to_rep
                                            (rec__with_default__bad_nested_defaults1__empty_rec__d
                                            (us_split_discrs1
                                            (rec__with_default__bad_nested_defaults1__non_init__e
                                            (us_split_fields1
                                            temp___expr_594))))) c))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

(define-fun default_initial_assumption1 ((temp___expr_585 us_rep)
  (temp___skip_top_level_586 Bool)) Bool (= (to_rep
                                            (rec__with_default__bad_nested_defaults1__empty_rec__d
                                            (us_split_discrs1
                                            temp___expr_585))) c))

(assert
;; defqtvc
 ;; File "with_default.ads", line 22, characters 0-0
  (not (=> (dynamic_invariant c true false true true) (in_range1 c))))
(check-sat)