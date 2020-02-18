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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

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
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-sort tvalue_arrayC 0)

(declare-fun tvalue_arrayCqtint (tvalue_arrayC) Int)

;; tvalue_arrayC'axiom
  (assert
  (forall ((i tvalue_arrayC))
  (and (<= 0 (tvalue_arrayCqtint i)) (<= (tvalue_arrayCqtint i) 10))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (tvalue_arrayC tvalue_arrayC) Bool)

(declare-const dummy1 tvalue_arrayC)

(declare-datatypes ((tvalue_arrayC__ref 0))
(((tvalue_arrayC__refqtmk (tvalue_arrayC__content tvalue_arrayC)))))
(define-fun tvalue_arrayC__ref_tvalue_arrayC__content__projection ((a tvalue_arrayC__ref)) tvalue_arrayC 
  (tvalue_arrayC__content a))

(define-fun to_rep ((x tvalue_arrayC)) Int (tvalue_arrayCqtint x))

(declare-fun of_rep (Int) tvalue_arrayC)

;; inversion_axiom
  (assert
  (forall ((x tvalue_arrayC))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x tvalue_arrayC)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int tvalue_arrayC))))))
(declare-fun slide ((Array Int tvalue_arrayC) Int
  Int) (Array Int tvalue_arrayC))

;; slide_eq
  (assert
  (forall ((a (Array Int tvalue_arrayC)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int tvalue_arrayC)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int tvalue_arrayC)) (a__first Int)
  (a__last Int) (b (Array Int tvalue_arrayC)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int tvalue_arrayC)) (b (Array Int tvalue_arrayC)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const values (Array Int tvalue_arrayC))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort t1s 0)

(declare-fun t1sqtint (t1s) Int)

;; t1s'axiom
  (assert (forall ((i t1s)) (and (<= 0 (t1sqtint i)) (<= (t1sqtint i) 10))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (t1s t1s) Bool)

(declare-const dummy2 t1s)

(declare-datatypes ((t1s__ref 0))
(((t1s__refqtmk (t1s__content t1s)))))
(define-fun t1s__ref_t1s__content__projection ((a t1s__ref)) t1s (t1s__content
                                                                 a))

(define-fun to_rep1 ((x t1s)) Int (t1sqtint x))

(declare-fun of_rep1 (Int) t1s)

;; inversion_axiom
  (assert
  (forall ((x t1s)) (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x t1s)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort t2s 0)

(declare-fun t2sqtint (t2s) Int)

;; t2s'axiom
  (assert (forall ((i t2s)) (and (<= 1 (t2sqtint i)) (<= (t2sqtint i) 10))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (t2s t2s) Bool)

(declare-const dummy3 t2s)

(declare-datatypes ((t2s__ref 0))
(((t2s__refqtmk (t2s__content t2s)))))
(define-fun t2s__ref_t2s__content__projection ((a t2s__ref)) t2s (t2s__content
                                                                 a))

(define-fun to_rep2 ((x t2s)) Int (t2sqtint x))

(declare-fun of_rep2 (Int) t2s)

;; inversion_axiom
  (assert
  (forall ((x t2s)) (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x t2s)) (! (in_range3 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__pred__pair_type__left t1s)(rec__pred__pair_type__right t2s)))))
(define-fun us_split_fields_rec__pred__pair_type__left__projection ((a us_split_fields)) t1s 
  (rec__pred__pair_type__left a))

(define-fun us_split_fields_rec__pred__pair_type__right__projection ((a us_split_fields)) t2s 
  (rec__pred__pair_type__right a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1
                           (rec__pred__pair_type__left (us_split_fields1 a))) 
                        (to_rep1
                        (rec__pred__pair_type__left (us_split_fields1 b))))
                        (= (to_rep2
                           (rec__pred__pair_type__right (us_split_fields1 a))) 
                        (to_rep2
                        (rec__pred__pair_type__right (us_split_fields1 b)))))
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

(declare-const pred__pair_type__left__first__bit Int)

(declare-const pred__pair_type__left__last__bit Int)

(declare-const pred__pair_type__left__position Int)

;; pred__pair_type__left__first__bit_axiom
  (assert (<= 0 pred__pair_type__left__first__bit))

;; pred__pair_type__left__last__bit_axiom
  (assert
  (< pred__pair_type__left__first__bit pred__pair_type__left__last__bit))

;; pred__pair_type__left__position_axiom
  (assert (<= 0 pred__pair_type__left__position))

(declare-const pred__pair_type__right__first__bit Int)

(declare-const pred__pair_type__right__last__bit Int)

(declare-const pred__pair_type__right__position Int)

;; pred__pair_type__right__first__bit_axiom
  (assert (<= 0 pred__pair_type__right__first__bit))

;; pred__pair_type__right__last__bit_axiom
  (assert
  (< pred__pair_type__right__first__bit pred__pair_type__right__last__bit))

;; pred__pair_type__right__position_axiom
  (assert (<= 0 pred__pair_type__right__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((pair_type__ref 0))
(((pair_type__refqtmk (pair_type__content us_rep)))))
(define-fun pair_type__ref_pair_type__content__projection ((a pair_type__ref)) us_rep 
  (pair_type__content a))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant1 ((temp___expr_170 us_rep)
  (temp___is_init_166 Bool) (temp___skip_constant_167 Bool)
  (temp___do_toplevel_168 Bool)
  (temp___do_typ_inv_169 Bool)) Bool (=> (= temp___do_toplevel_168 true)
                                     (=> (= temp___is_init_166 true)
                                     (<= (to_rep1
                                         (rec__pred__pair_type__left
                                         (us_split_fields1 temp___expr_170))) 
                                     (to_rep
                                     (select values (to_rep2
                                                    (rec__pred__pair_type__right
                                                    (us_split_fields1
                                                    temp___expr_170)))))))))

(define-fun dynamic_predicate ((temp___176 us_rep)) Bool (<= (to_rep1
                                                             (rec__pred__pair_type__left
                                                             (us_split_fields1
                                                             temp___176))) 
  (to_rep
  (select values (to_rep2
                 (rec__pred__pair_type__right (us_split_fields1 temp___176)))))))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const rliteral t1s)

;; rliteral_axiom
  (assert (= (t1sqtint rliteral) 0))

(declare-const rliteral1 t2s)

;; rliteral_axiom
  (assert (= (t2sqtint rliteral1) 1))

(assert
;; defqtvc
 ;; File "pred.ads", line 3, characters 0-0
  (not
  (forall ((values1 (Array Int tvalue_arrayC)))
  (=> (= values1 values) (dynamic_predicate
  (us_repqtmk (us_split_fieldsqtmk rliteral rliteral1)))))))
(check-sat)