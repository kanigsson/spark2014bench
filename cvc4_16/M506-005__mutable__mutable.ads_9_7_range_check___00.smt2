(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
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

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort d 0)

(declare-fun dqtint (d) Int)

;; d'axiom
  (assert (forall ((i d)) (and (<= 1 (dqtint i)) (<= (dqtint i) 10))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (d d) Bool)

(declare-const dummy1 d)

(declare-datatypes ((d__ref 0))
(((d__refqtmk (d__content d)))))
(define-fun d__ref_d__content__projection ((a d__ref)) d (d__content a))

(define-fun to_rep1 ((x d)) Int (dqtint x))

(declare-fun of_rep1 (Int) d)

;; inversion_axiom
  (assert
  (forall ((x d)) (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x d)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort tdB 0)

(declare-fun tdBqtint (tdB) Int)

;; tdB'axiom
  (assert
  (forall ((i tdB))
  (and (<= (- 2147483648) (tdBqtint i)) (<= (tdBqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (tdB tdB) Bool)

(declare-const dummy2 tdB)

(declare-datatypes ((tdB__ref 0))
(((tdB__refqtmk (tdB__content tdB)))))
(define-fun tdB__ref_tdB__content__projection ((a tdB__ref)) tdB (tdB__content
                                                                 a))

(define-fun to_rep2 ((x tdB)) Int (tdBqtint x))

(declare-fun of_rep2 (Int) tdB)

;; inversion_axiom
  (assert
  (forall ((x tdB)) (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x tdB)) (! (in_range2 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
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
  (forall ((a (Array Int integer)) (b (Array Int integer)))
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

(declare-sort t 0)

(declare-fun first (t) tdB)

(declare-fun last (t) tdB)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep2 (first (mk f l))) f) (= (to_rep2 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep2 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep2 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep2 (first (rt x)))
                 (to_rep2 (last (rt x))) (elts y) (to_rep2 (first (rt y)))
                 (to_rep2 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((a__ref 0))
(((a__refqtmk (a__content us_t)))))
(define-fun a__ref_a__content__projection ((a a__ref)) us_t (a__content a))

(declare-datatypes ((t4s__ref 0))
(((t4s__refqtmk (t4s__content us_t)))))
(define-fun t4s__ref_t4s__content__projection ((a t4s__ref)) us_t (t4s__content
                                                                  a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__mutable__t__k d)))))
(define-fun us_split_discrs_rec__mutable__t__k__projection ((a us_split_discrs)) d 
  (rec__mutable__t__k a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__mutable__t__som integer)(rec__mutable__t__arr us_t)))))
(define-fun us_split_fields_rec__mutable__t__som__projection ((a us_split_fields)) integer 
  (rec__mutable__t__som a))

(define-fun us_split_fields_rec__mutable__t__arr__projection ((a us_split_fields)) us_t 
  (rec__mutable__t__arr a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1
                           (rec__mutable__t__k (us_split_discrs1 a))) 
                        (to_rep1 (rec__mutable__t__k (us_split_discrs1 b))))
                        (and
                        (= (to_rep
                           (rec__mutable__t__som (us_split_fields1 a))) 
                        (to_rep (rec__mutable__t__som (us_split_fields1 b))))
                        (= (bool_eq1
                           (rec__mutable__t__arr (us_split_fields1 a))
                           (rec__mutable__t__arr (us_split_fields1 b))) true)))
                   true false))

(define-fun in_range3 ((rec__mutable__t__k1 Int)
  (a us_split_discrs)) Bool (= rec__mutable__t__k1 (to_rep1
                                                   (rec__mutable__t__k a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const mutable__t__k__first__bit Int)

(declare-const mutable__t__k__last__bit Int)

(declare-const mutable__t__k__position Int)

;; mutable__t__k__first__bit_axiom
  (assert (<= 0 mutable__t__k__first__bit))

;; mutable__t__k__last__bit_axiom
  (assert (< mutable__t__k__first__bit mutable__t__k__last__bit))

;; mutable__t__k__position_axiom
  (assert (<= 0 mutable__t__k__position))

(declare-const mutable__t__som__first__bit Int)

(declare-const mutable__t__som__last__bit Int)

(declare-const mutable__t__som__position Int)

;; mutable__t__som__first__bit_axiom
  (assert (<= 0 mutable__t__som__first__bit))

;; mutable__t__som__last__bit_axiom
  (assert (< mutable__t__som__first__bit mutable__t__som__last__bit))

;; mutable__t__som__position_axiom
  (assert (<= 0 mutable__t__som__position))

(declare-const mutable__t__arr__first__bit Int)

(declare-const mutable__t__arr__last__bit Int)

(declare-const mutable__t__arr__position Int)

;; mutable__t__arr__first__bit_axiom
  (assert (<= 0 mutable__t__arr__first__bit))

;; mutable__t__arr__last__bit_axiom
  (assert (< mutable__t__arr__first__bit mutable__t__arr__last__bit))

;; mutable__t__arr__position_axiom
  (assert (<= 0 mutable__t__arr__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(define-fun dynamic_invariant ((temp___expr_164 Int)
  (temp___is_init_160 Bool) (temp___skip_constant_161 Bool)
  (temp___do_toplevel_162 Bool)
  (temp___do_typ_inv_163 Bool)) Bool (=>
                                     (or (= temp___is_init_160 true)
                                     (<= 1 10)) (in_range1 temp___expr_164)))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_177 us_rep)
  (temp___is_init_173 Bool) (temp___skip_constant_174 Bool)
  (temp___do_toplevel_175 Bool)
  (temp___do_typ_inv_176 Bool)) Bool (let ((temp___178 (rec__mutable__t__k
                                                       (us_split_discrs1
                                                       temp___expr_177))))
                                     (and (dynamic_property 1
                                     (to_rep1 temp___178)
                                     (first1
                                     (rec__mutable__t__arr
                                     (us_split_fields1 temp___expr_177)))
                                     (last1
                                     (rec__mutable__t__arr
                                     (us_split_fields1 temp___expr_177))))
                                     (and
                                     (= (first1
                                        (rec__mutable__t__arr
                                        (us_split_fields1 temp___expr_177))) 1)
                                     (= (last1
                                        (rec__mutable__t__arr
                                        (us_split_fields1 temp___expr_177))) 
                                     (to_rep1 temp___178))))))

(define-fun default_initial_assumption ((temp___expr_180 us_rep)
  (temp___skip_top_level_181 Bool)) Bool (and
                                         (= (to_rep1
                                            (rec__mutable__t__k
                                            (us_split_discrs1
                                            temp___expr_180))) 10)
                                         (and
                                         (= (first1
                                            (rec__mutable__t__arr
                                            (us_split_fields1
                                            temp___expr_180))) 1)
                                         (= (last1
                                            (rec__mutable__t__arr
                                            (us_split_fields1
                                            temp___expr_180))) (to_rep1
                                                               (rec__mutable__t__k
                                                               (us_split_discrs1
                                                               temp___expr_180)))))))

(assert
;; defqtvc
 ;; File "mutable.ads", line 1, characters 0-0
  (not
  (forall ((usf Int) (usf1 us_rep))
  (=> (dynamic_invariant usf true true true true)
  (=> (= (to_rep1 (rec__mutable__t__k (us_split_discrs1 usf1))) usf)
  (=> (<= 1 usf) (<= 1 1)))))))
(check-sat)
(exit)
