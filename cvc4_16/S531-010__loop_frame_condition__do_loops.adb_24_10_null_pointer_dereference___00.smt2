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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

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

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__do_loops__r__f1 integer)(rec__do_loops__r__f2 integer)))))
(define-fun us_split_fields_rec__do_loops__r__f1__projection ((a us_split_fields)) integer 
  (rec__do_loops__r__f1 a))

(define-fun us_split_fields_rec__do_loops__r__f2__projection ((a us_split_fields)) integer 
  (rec__do_loops__r__f2 a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__do_loops__r__f1 (us_split_fields1 a))) 
                        (to_rep (rec__do_loops__r__f1 (us_split_fields1 b))))
                        (= (to_rep
                           (rec__do_loops__r__f2 (us_split_fields1 a))) 
                        (to_rep (rec__do_loops__r__f2 (us_split_fields1 b)))))
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

(declare-const do_loops__r__f1__first__bit Int)

(declare-const do_loops__r__f1__last__bit Int)

(declare-const do_loops__r__f1__position Int)

;; do_loops__r__f1__first__bit_axiom
  (assert (<= 0 do_loops__r__f1__first__bit))

;; do_loops__r__f1__last__bit_axiom
  (assert (< do_loops__r__f1__first__bit do_loops__r__f1__last__bit))

;; do_loops__r__f1__position_axiom
  (assert (<= 0 do_loops__r__f1__position))

(declare-const do_loops__r__f2__first__bit Int)

(declare-const do_loops__r__f2__last__bit Int)

(declare-const do_loops__r__f2__position Int)

;; do_loops__r__f2__first__bit_axiom
  (assert (<= 0 do_loops__r__f2__first__bit))

;; do_loops__r__f2__last__bit_axiom
  (assert (< do_loops__r__f2__first__bit do_loops__r__f2__last__bit))

;; do_loops__r__f2__position_axiom
  (assert (<= 0 do_loops__r__f2__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((r__ref 0))
(((r__refqtmk (r__content us_rep)))))
(define-fun r__ref_r__content__projection ((a r__ref)) us_rep (r__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int us_rep))))))
(declare-fun slide ((Array Int us_rep) Int Int) (Array Int us_rep))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int us_rep)) (a__first Int) (a__last Int)
  (b (Array Int us_rep)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (bool_eq (select a temp___idx_154)
                              (select b (+ (- b__first a__first) temp___idx_154))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep)) (b (Array Int us_rep)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (bool_eq (select a temp___idx_154)
     (select b (+ (- b__first a__first) temp___idx_154))) true))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int us_rep))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int us_rep) (elts a))

(define-fun of_array ((a (Array Int us_rep)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment1))

(define-fun bool_eq2 ((x us_t)
  (y us_t)) Bool (bool_eq1 (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((u_array__ref 0))
(((u_array__refqtmk (u_array__content us_t)))))
(define-fun u_array__ref_u_array__content__projection ((a u_array__ref)) us_t 
  (u_array__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const r5b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const r6b Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (rec__do_loops__u_array_acc__is_null_pointer Bool)(rec__do_loops__u_array_acc__pointer_address Int)(rec__do_loops__u_array_acc__pointer_value us_t)))))
(define-fun us_rep_rec__do_loops__u_array_acc__is_null_pointer__projection ((a us_rep1)) Bool 
  (rec__do_loops__u_array_acc__is_null_pointer a))

(define-fun us_rep_rec__do_loops__u_array_acc__pointer_address__projection ((a us_rep1)) Int 
  (rec__do_loops__u_array_acc__pointer_address a))

(define-fun us_rep_rec__do_loops__u_array_acc__pointer_value__projection ((a us_rep1)) us_t 
  (rec__do_loops__u_array_acc__pointer_value a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep1)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep1 
  (us_rep__content a))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (rec__do_loops__u_array_acc__is_null_pointer a) 
                         (rec__do_loops__u_array_acc__is_null_pointer b))
                         (=>
                         (not
                         (= (rec__do_loops__u_array_acc__is_null_pointer a) true))
                         (and
                         (= (rec__do_loops__u_array_acc__pointer_address a) 
                         (rec__do_loops__u_array_acc__pointer_address b))
                         (= (rec__do_loops__u_array_acc__pointer_value a) 
                         (rec__do_loops__u_array_acc__pointer_value b)))))
                    true false))

(define-fun rec__do_loops__u_array_acc__pointer_value__pred ((a us_rep1)) Bool 
  (not (= (rec__do_loops__u_array_acc__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep1)

;; __null_pointer__def_axiom
  (assert
  (= (rec__do_loops__u_array_acc__is_null_pointer us_null_pointer) true))

(declare-const dummy4 us_rep1)

(declare-datatypes ((u_array_acc__ref 0))
(((u_array_acc__refqtmk (u_array_acc__content us_rep1)))))
(define-fun u_array_acc__ref_u_array_acc__content__projection ((a u_array_acc__ref)) us_rep1 
  (u_array_acc__content a))

(define-fun dynamic_invariant1 ((temp___expr_193 us_rep1)
  (temp___is_init_189 Bool) (temp___skip_constant_190 Bool)
  (temp___do_toplevel_191 Bool)
  (temp___do_typ_inv_192 Bool)) Bool (=>
                                     (not
                                     (= (rec__do_loops__u_array_acc__is_null_pointer
                                        temp___expr_193) true))
                                     (dynamic_property 1 2147483647
                                     (first1
                                     (rec__do_loops__u_array_acc__pointer_value
                                     temp___expr_193))
                                     (last1
                                     (rec__do_loops__u_array_acc__pointer_value
                                     temp___expr_193)))))

(define-fun default_initial_assumption ((temp___expr_195 us_rep1)
  (temp___skip_top_level_196 Bool)) Bool (= (rec__do_loops__u_array_acc__is_null_pointer
                                            temp___expr_195) true))

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun default_initial_assumption1 ((temp___expr_181 us_rep)
  (temp___skip_top_level_182 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__do_loops__r__f1
                                            (us_split_fields1
                                            temp___expr_181))) 0)
                                         (= (to_rep
                                            (rec__do_loops__r__f2
                                            (us_split_fields1
                                            temp___expr_181))) 0)))

(define-fun dynamic_invariant3 ((temp___expr_187 us_t)
  (temp___is_init_183 Bool) (temp___skip_constant_184 Bool)
  (temp___do_toplevel_185 Bool)
  (temp___do_typ_inv_186 Bool)) Bool (=>
                                     (not (= temp___skip_constant_184 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_187)
                                     (last1 temp___expr_187))))

(assert
;; defqtvc
 ;; File "do_loops.adb", line 18, characters 0-0
  (not
  (forall ((a__pointer_value us_t) (a__pointer_address Int)
  (a__is_null_pointer Bool))
  (=> (dynamic_invariant1
  (us_repqtmk1 a__is_null_pointer a__pointer_address a__pointer_value) true
  false true true)
  (=>
  (not
  (= (bool_eq3
     (us_repqtmk1 a__is_null_pointer a__pointer_address a__pointer_value)
     us_null_pointer) true))
  (=> (= (first1 a__pointer_value) r5b)
  (=> (dynamic_invariant r5b true false true true)
  (=> (= (last1 a__pointer_value) r6b)
  (=> (dynamic_invariant r6b true false true true)
  (let ((temp___573 r5b))
  (let ((temp___574 r6b))
  (forall ((i Int))
  (=> (= i temp___573)
  (=>
  (= (and (ite (<= temp___573 i) true false) (ite (<= i temp___574) true
                                             false)) true)
  (forall ((a__pointer_value1 us_t) (i1 Int))
  (=>
  (= (and (ite (and (dynamic_invariant1
               (us_repqtmk1 a__is_null_pointer a__pointer_address
               a__pointer_value1) true true true true)
               (=> (= a__is_null_pointer false)
               (and
               (and (= (first1 a__pointer_value1) (first1 a__pointer_value))
               (= (last1 a__pointer_value1) (last1 a__pointer_value)))
               (forall ((temp___581 Int))
               (=>
               (and (<= (first1 a__pointer_value1) temp___581)
               (<= temp___581 (last1 a__pointer_value1)))
               (ite (or (< temp___574 temp___581)
                    (or (< temp___581 temp___573) (<= i1 temp___581)))
               (= (select (to_array a__pointer_value1) temp___581) (select 
               (to_array a__pointer_value) temp___581))
               (= (rec__do_loops__r__f2
                  (us_split_fields1
                  (select (to_array a__pointer_value1) temp___581))) 
               (rec__do_loops__r__f2
               (us_split_fields1
               (select (to_array a__pointer_value) temp___581))))))))))
          true false) (ite (and (<= r5b i1) (<= i1 r6b)) true false)) true)
  (rec__do_loops__u_array_acc__pointer_value__pred
  (us_repqtmk1 a__is_null_pointer a__pointer_address a__pointer_value1))))))))))))))))))
(check-sat)
(exit)
