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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__foo__misc_private_t__valid Bool)))))
(define-fun us_split_discrs_rec__foo__misc_private_t__valid__projection ((a us_split_discrs)) Bool 
  (rec__foo__misc_private_t__valid a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__5__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__foo__misc_private_t__field integer)))))
(define-fun us_split_fields_rec__foo__misc_private_t__field__projection ((a us_split_fields)) integer 
  (rec__foo__misc_private_t__field a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__13__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__6__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__13__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun foo__misc_private_t__field__pred ((a us_rep)) Bool (= (ite 
  (rec__foo__misc_private_t__valid (us_split_discrs1 a)) 1 0) 1))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__foo__misc_private_t__valid
                                (us_split_discrs1 a)) 1 0) (ite (rec__foo__misc_private_t__valid
                                                                (us_split_discrs1
                                                                b)) 1 0))
                        (=> (foo__misc_private_t__field__pred a)
                        (= (to_rep
                           (rec__foo__misc_private_t__field
                           (us_split_fields1 a))) (to_rep
                                                  (rec__foo__misc_private_t__field
                                                  (us_split_fields1 b))))))
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

(declare-const foo__misc_private_t__valid__first__bit Int)

(declare-const foo__misc_private_t__valid__last__bit Int)

(declare-const foo__misc_private_t__valid__position Int)

;; foo__misc_private_t__valid__first__bit_axiom
  (assert (<= 0 foo__misc_private_t__valid__first__bit))

;; foo__misc_private_t__valid__last__bit_axiom
  (assert
  (< foo__misc_private_t__valid__first__bit foo__misc_private_t__valid__last__bit))

;; foo__misc_private_t__valid__position_axiom
  (assert (<= 0 foo__misc_private_t__valid__position))

(declare-const foo__misc_private_t__field__first__bit Int)

(declare-const foo__misc_private_t__field__last__bit Int)

(declare-const foo__misc_private_t__field__position Int)

;; foo__misc_private_t__field__first__bit_axiom
  (assert (<= 0 foo__misc_private_t__field__first__bit))

;; foo__misc_private_t__field__last__bit_axiom
  (assert
  (< foo__misc_private_t__field__first__bit foo__misc_private_t__field__last__bit))

;; foo__misc_private_t__field__position_axiom
  (assert (<= 0 foo__misc_private_t__field__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((misc_private_t__ref 0))
(((misc_private_t__refqtmk (misc_private_t__content us_rep)))))
(define-fun misc_private_t__ref_misc_private_t__content__projection ((a misc_private_t__ref)) us_rep 
  (misc_private_t__content a))

(declare-const a us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const n Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun in_range2 ((rec__foo__misc_private_t__valid1 Bool)
  (a1 us_rep)) Bool (= rec__foo__misc_private_t__valid1 (rec__foo__misc_private_t__valid
                                                        (us_split_discrs1 a1))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const foo__misc_private_t__valid__first__bit1 Int)

(declare-const foo__misc_private_t__valid__last__bit1 Int)

(declare-const foo__misc_private_t__valid__position1 Int)

;; foo__misc_private_t__valid__first__bit_axiom
  (assert (<= 0 foo__misc_private_t__valid__first__bit1))

;; foo__misc_private_t__valid__last__bit_axiom
  (assert
  (< foo__misc_private_t__valid__first__bit1 foo__misc_private_t__valid__last__bit1))

;; foo__misc_private_t__valid__position_axiom
  (assert (<= 0 foo__misc_private_t__valid__position1))

(declare-const foo__misc_private_t__field__first__bit1 Int)

(declare-const foo__misc_private_t__field__last__bit1 Int)

(declare-const foo__misc_private_t__field__position1 Int)

;; foo__misc_private_t__field__first__bit_axiom
  (assert (<= 0 foo__misc_private_t__field__first__bit1))

;; foo__misc_private_t__field__last__bit_axiom
  (assert
  (< foo__misc_private_t__field__first__bit1 foo__misc_private_t__field__last__bit1))

;; foo__misc_private_t__field__position_axiom
  (assert (<= 0 foo__misc_private_t__field__position1))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__2__projection ((a1 t__ref)) us_rep (t__content
                                                                  a1))

(declare-const x__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_invariant1 ((temp___expr_374 us_rep)
  (temp___is_init_370 Bool) (temp___skip_constant_371 Bool)
  (temp___do_toplevel_372 Bool)
  (temp___do_typ_inv_373 Bool)) Bool (=>
                                     (not (= temp___skip_constant_371 true))
                                     (in_range2 (distinct 0 0)
                                     temp___expr_374)))

(define-fun default_initial_assumption ((temp___expr_376 us_rep)
  (temp___skip_top_level_377 Bool)) Bool (= (rec__foo__misc_private_t__valid
                                            (us_split_discrs1
                                            temp___expr_376)) (distinct 0 0)))

(assert
;; defqtvc
 ;; File "tests.adb", line 391, characters 0-0
  (not
  (forall ((x__split_fields integer))
  (=> (dynamic_invariant n true false true true)
  (=> (not (= (rec__foo__misc_private_t__valid (us_split_discrs1 a)) true))
  (=> (default_initial_assumption
  (us_repqtmk x__split_discrs (us_split_fieldsqtmk x__split_fields)) false)
  (=> (dynamic_invariant1
  (us_repqtmk x__split_discrs (us_split_fieldsqtmk x__split_fields)) false
  false true true) (in_range2 (distinct 0 0) a))))))))
(check-sat)