;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-sort t 0)

(declare-fun tqtint (t) Int)

;; t'axiom
  (assert
  (forall ((i t))
  (and (<= (- 2147483648) (tqtint i)) (<= (tqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (t t) Bool)

(declare-const dummy t)

(declare-datatypes () ((t__ref (t__refqtmk (t__content t)))))
(define-fun t__ref_t__content__projection ((a t__ref)) t (t__content a))

(define-fun to_rep ((x t)) Int (tqtint x))

(declare-fun of_rep (Int) t)

;; inversion_axiom
  (assert
  (forall ((x t)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert (forall ((x t)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__aggregates__rec_t__a t)(rec__aggregates__rec_t__b t)))))
(define-fun us_split_fields_rec__aggregates__rec_t__a__projection ((a us_split_fields)) t 
  (rec__aggregates__rec_t__a a))

(define-fun us_split_fields_rec__aggregates__rec_t__b__projection ((a us_split_fields)) t 
  (rec__aggregates__rec_t__b a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__aggregates__rec_t__a (us_split_fields1 a))) 
                        (to_rep
                        (rec__aggregates__rec_t__a (us_split_fields1 b))))
                        (= (to_rep
                           (rec__aggregates__rec_t__b (us_split_fields1 a))) 
                        (to_rep
                        (rec__aggregates__rec_t__b (us_split_fields1 b)))))
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

(declare-const aggregates__rec_t__a__first__bit Int)

(declare-const aggregates__rec_t__a__last__bit Int)

(declare-const aggregates__rec_t__a__position Int)

;; aggregates__rec_t__a__first__bit_axiom
  (assert (<= 0 aggregates__rec_t__a__first__bit))

;; aggregates__rec_t__a__last__bit_axiom
  (assert
  (< aggregates__rec_t__a__first__bit aggregates__rec_t__a__last__bit))

;; aggregates__rec_t__a__position_axiom
  (assert (<= 0 aggregates__rec_t__a__position))

(declare-const aggregates__rec_t__b__first__bit Int)

(declare-const aggregates__rec_t__b__last__bit Int)

(declare-const aggregates__rec_t__b__position Int)

;; aggregates__rec_t__b__first__bit_axiom
  (assert (<= 0 aggregates__rec_t__b__first__bit))

;; aggregates__rec_t__b__last__bit_axiom
  (assert
  (< aggregates__rec_t__b__first__bit aggregates__rec_t__b__last__bit))

;; aggregates__rec_t__b__position_axiom
  (assert (<= 0 aggregates__rec_t__b__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ()
((rec_t__ref (rec_t__refqtmk (rec_t__content us_rep)))))
(define-fun rec_t__ref_rec_t__content__projection ((a rec_t__ref)) us_rep 
  (rec_t__content a))

(define-fun default_initial_assumption ((temp___expr_181 us_rep)
  (temp___skip_top_level_182 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__aggregates__rec_t__a
                                            (us_split_fields1
                                            temp___expr_181))) 42)
                                         (= (to_rep
                                            (rec__aggregates__rec_t__b
                                            (us_split_fields1
                                            temp___expr_181))) 42)))

(define-fun type_invariant ((temp___157 Int)) Bool (not (= temp___157 0)))

(define-fun dynamic_invariant ((temp___expr_163 Int)
  (temp___is_init_159 Bool) (temp___skip_constant_160 Bool)
  (temp___do_toplevel_161 Bool)
  (temp___do_typ_inv_162 Bool)) Bool (=>
                                     (or (= temp___is_init_159 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range temp___expr_163)))

(declare-sort tarr_tD1 0)

(declare-fun tarr_tD1qtint (tarr_tD1) Int)

;; tarr_tD1'axiom
  (assert
  (forall ((i tarr_tD1))
  (and (<= 1 (tarr_tD1qtint i)) (<= (tarr_tD1qtint i) 2))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq2 (tarr_tD1 tarr_tD1) Bool)

(declare-const dummy2 tarr_tD1)

(declare-datatypes ()
((tarr_tD1__ref (tarr_tD1__refqtmk (tarr_tD1__content tarr_tD1)))))
(define-fun tarr_tD1__ref_tarr_tD1__content__projection ((a tarr_tD1__ref)) tarr_tD1 
  (tarr_tD1__content a))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int t))))))
(declare-fun slide ((Array Int t) Int Int) (Array Int t))

;; slide_eq
  (assert
  (forall ((a (Array Int t)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int t)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int t)) (a__first Int) (a__last Int)
  (b (Array Int t)) (b__first Int)
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
  (forall ((a (Array Int t)) (b (Array Int t)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(define-fun default_initial_assumption1 ((temp___expr_172 (Array Int t))
  (temp___skip_top_level_173 Bool)) Bool (forall ((temp___174 Int))
                                         (=>
                                         (and (<= 1 temp___174)
                                         (<= temp___174 2))
                                         (= (to_rep
                                            (select temp___expr_172 temp___174)) 42))))

(declare-const usf (Array Int t))

;; Ensures
  (assert true)

;; Assume
  (assert
  (forall ((temp___192 Int))
  (=> (and (<= 1 temp___192) (<= temp___192 2))
  (= (to_rep (select usf temp___192)) 42))))

(declare-const temp___194 Int)

;; H
  (assert (<= 1 temp___194))

;; H
  (assert (<= temp___194 2))

(assert
;; defqtvc
 ;; File "aggregates.ads", line 1, characters 0-0
  (not (type_invariant (to_rep (select usf temp___194)))))
(check-sat)