(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__frame_condition__cell__value natural)(rec__frame_condition__cell__max_left natural)(rec__frame_condition__cell__max_right natural)))))
(define-fun us_split_fields_rec__frame_condition__cell__value__projection ((a us_split_fields)) natural 
  (rec__frame_condition__cell__value a))

(define-fun us_split_fields_rec__frame_condition__cell__max_left__projection ((a us_split_fields)) natural 
  (rec__frame_condition__cell__max_left a))

(define-fun us_split_fields_rec__frame_condition__cell__max_right__projection ((a us_split_fields)) natural 
  (rec__frame_condition__cell__max_right a))

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
                        (and
                        (= (to_rep
                           (rec__frame_condition__cell__value
                           (us_split_fields1 a))) (to_rep
                                                  (rec__frame_condition__cell__value
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__frame_condition__cell__max_left
                           (us_split_fields1 a))) (to_rep
                                                  (rec__frame_condition__cell__max_left
                                                  (us_split_fields1 b)))))
                        (= (to_rep
                           (rec__frame_condition__cell__max_right
                           (us_split_fields1 a))) (to_rep
                                                  (rec__frame_condition__cell__max_right
                                                  (us_split_fields1 b)))))
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

(declare-const frame_condition__cell__value__first__bit Int)

(declare-const frame_condition__cell__value__last__bit Int)

(declare-const frame_condition__cell__value__position Int)

;; frame_condition__cell__value__first__bit_axiom
  (assert (<= 0 frame_condition__cell__value__first__bit))

;; frame_condition__cell__value__last__bit_axiom
  (assert
  (< frame_condition__cell__value__first__bit frame_condition__cell__value__last__bit))

;; frame_condition__cell__value__position_axiom
  (assert (<= 0 frame_condition__cell__value__position))

(declare-const frame_condition__cell__max_left__first__bit Int)

(declare-const frame_condition__cell__max_left__last__bit Int)

(declare-const frame_condition__cell__max_left__position Int)

;; frame_condition__cell__max_left__first__bit_axiom
  (assert (<= 0 frame_condition__cell__max_left__first__bit))

;; frame_condition__cell__max_left__last__bit_axiom
  (assert
  (< frame_condition__cell__max_left__first__bit frame_condition__cell__max_left__last__bit))

;; frame_condition__cell__max_left__position_axiom
  (assert (<= 0 frame_condition__cell__max_left__position))

(declare-const frame_condition__cell__max_right__first__bit Int)

(declare-const frame_condition__cell__max_right__last__bit Int)

(declare-const frame_condition__cell__max_right__position Int)

;; frame_condition__cell__max_right__first__bit_axiom
  (assert (<= 0 frame_condition__cell__max_right__first__bit))

;; frame_condition__cell__max_right__last__bit_axiom
  (assert
  (< frame_condition__cell__max_right__first__bit frame_condition__cell__max_right__last__bit))

;; frame_condition__cell__max_right__position_axiom
  (assert (<= 0 frame_condition__cell__max_right__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes () ((cell__ref (cell__refqtmk (cell__content us_rep)))))
(define-fun cell__ref_cell__content__projection ((a cell__ref)) us_rep 
  (cell__content a))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int us_rep))))))
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

(declare-const a__first integer)

(declare-const a__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const first Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const last Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun get_max_left (Int (Array Int us_rep)) Int)

(declare-fun get_max_left__function_guard (Int Int (Array Int us_rep)) Bool)

;; get_max_left__post_axiom
  (assert
  (forall ((index Int))
  (forall ((frame_condition__update_max_2__a (Array Int us_rep)))
  (! (=>
     (and (dynamic_invariant1 index true true true true)
     (and (<= (to_rep1 a__first) index) (<= index (to_rep1 a__last))))
     (let ((result (get_max_left index frame_condition__update_max_2__a)))
     (=> (get_max_left__function_guard result index
     frame_condition__update_max_2__a) (dynamic_invariant result true false
     true true)))) :pattern ((get_max_left index
                             frame_condition__update_max_2__a)) ))))

;; get_max_left__def_axiom
  (assert
  (forall ((index Int))
  (forall ((frame_condition__update_max_2__a (Array Int us_rep)))
  (! (=> (dynamic_invariant1 index true true true true)
     (= (get_max_left index frame_condition__update_max_2__a) (to_rep
                                                              (rec__frame_condition__cell__max_left
                                                              (us_split_fields1
                                                              (select frame_condition__update_max_2__a index)))))) :pattern (
  (get_max_left index frame_condition__update_max_2__a)) ))))

(declare-sort t 0)

(declare-fun first1 (t) integer)

(declare-fun last1 (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep1 (first1 (mk f l))) f) (= (to_rep1 (last1 (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int us_rep))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int us_rep) (elts a))

(define-fun of_array ((a (Array Int us_rep)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first2 ((a us_t)) Int (to_rep1 (first1 (rt a))))

(define-fun last2 ((a us_t)) Int (to_rep1 (last1 (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first2 a) (last2 a))
                                   (+ (- (last2 a) (first2 a)) 1) 0))

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
  (y us_t)) Bool (bool_eq1 (elts x) (to_rep1 (first1 (rt x)))
                 (to_rep1 (last1 (rt x))) (elts y) (to_rep1 (first1 (rt y)))
                 (to_rep1 (last1 (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ()
((cell_array__ref (cell_array__refqtmk (cell_array__content us_t)))))
(define-fun cell_array__ref_cell_array__content__projection ((a cell_array__ref)) us_t 
  (cell_array__content a))

(declare-fun frame_left (us_t (Array Int us_rep)) Bool)

(declare-fun frame_left__function_guard (Bool us_t (Array Int us_rep)) Bool)

(define-fun dynamic_invariant2 ((temp___expr_173 us_t)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (=>
                                     (not (= temp___skip_constant_170 true))
                                     (dynamic_property 1 2147483647
                                     (first2 temp___expr_173)
                                     (last2 temp___expr_173))))

;; frame_left__post_axiom
  (assert true)

;; frame_left__def_axiom
  (assert
  (forall ((old_a us_t))
  (forall ((frame_condition__update_max_2__a (Array Int us_rep)))
  (! (= (= (frame_left old_a frame_condition__update_max_2__a) true)
     (forall ((i Int))
     (=> (and (<= (to_rep1 a__first) i) (<= i (to_rep1 a__last)))
     (= (to_rep
        (rec__frame_condition__cell__value
        (us_split_fields1 (select frame_condition__update_max_2__a i)))) 
     (to_rep
     (rec__frame_condition__cell__value
     (us_split_fields1 (select (to_array old_a) i)))))))) :pattern ((frame_left
                                                                    old_a
                                                                    frame_condition__update_max_2__a)) ))))

(declare-const first3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const last3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

;; first__def_axiom
  (assert (= first (to_rep1 a__first)))

;; last__def_axiom
  (assert (= last (to_rep1 a__last)))

;; first__def_axiom
  (assert (= first3 first))

;; last__def_axiom
  (assert (= last3 last))

(declare-const a (Array Int us_rep))

(declare-const a1 (Array Int us_rep))

;; H
  (assert (= a1 a))

;; Assume
  (assert (dynamic_invariant1 first true false true true))

(declare-const temp___358 Int)

;; Ensures
  (assert (= (to_rep1 a__first) temp___358))

;; Assume
  (assert (= temp___358 first))

;; Assume
  (assert (dynamic_invariant1 last true false true true))

(declare-const temp___359 Int)

;; Ensures
  (assert (= (to_rep1 a__last) temp___359))

;; Assume
  (assert (= temp___359 last))

;; Assume
  (assert (dynamic_property 1 2147483647 (to_rep1 a__first)
  (to_rep1 a__last)))

;; Assume
  (assert (dynamic_invariant1 first3 true false true true))

;; Assume
  (assert (= first first3))

;; Assume
  (assert (dynamic_invariant1 last3 true false true true))

;; Assume
  (assert (= last last3))

;; Assume
  (assert (< 0 (length (to_rep1 a__first) (to_rep1 a__last))))

(declare-const k Int)

;; H
  (assert (= k first3))

;; Assume
  (assert (dynamic_invariant1 k true false true true))

(declare-const max Int)

;; H
  (assert (= max 0))

;; Assume
  (assert (dynamic_invariant max true false true true))

(declare-const temp___loop_entry_338 (Array Int us_rep))

;; H
  (assert (= temp___loop_entry_338 a))

(declare-const spark__branch Bool)

(declare-const max1 Int)

;; Assert
  (assert (and (<= (to_rep1 a__first) k) (<= k (to_rep1 a__last))))

(declare-const o Int)

;; Ensures
  (assert
  (= (to_rep
     (rec__frame_condition__cell__value (us_split_fields1 (select a k)))) 
  o))

;; H
  (assert (= spark__branch (ite (< max o) true false)))

(declare-const o1 Int)

;; H
  (assert
  (ite (= spark__branch true)
  (and (and (<= (to_rep1 a__first) k) (<= k (to_rep1 a__last)))
  (and
  (= (to_rep
     (rec__frame_condition__cell__value (us_split_fields1 (select a k)))) 
  o1) (= max1 o1))) (= max1 max)))

(declare-const c238b Int)

;; H
  (assert (= c238b k))

;; Assume
  (assert (dynamic_invariant1 c238b true false true true))

(declare-const c239b Int)

;; H
  (assert (= c239b max1))

;; Assume
  (assert (dynamic_invariant c239b true false true true))

(define-fun q_ () us_split_fields (us_split_fields1 (select a c238b)))

(declare-const o2 natural)

;; Ensures
  (assert (= (to_rep o2) c239b))

;; Assert
  (assert (and (<= (to_rep1 a__first) c238b) (<= c238b (to_rep1 a__last))))

(declare-const a2 (Array Int us_rep))

;; H
  (assert
  (= a2 (store a c238b (us_repqtmk
                       (us_split_fieldsqtmk
                       (rec__frame_condition__cell__value q_) o2
                       (rec__frame_condition__cell__max_right q_))))))

(declare-const o3 Int)

;; Ensures
  (assert (= (to_rep1 a__last) o3))

(declare-const o4 Int)

;; Ensures
  (assert (= (to_rep1 a__first) o4))

;; LoopInvariant
  (assert (and (<= (to_rep1 a__first) k) (<= k (to_rep1 a__last))))

(declare-const i Int)

;; H
  (assert (<= first3 i))

;; H
  (assert (<= i k))

(assert
;; defqtvc
 ;; File "frame_condition.adb", line 122, characters 0-0
  (not
  (<= (to_rep
      (rec__frame_condition__cell__value (us_split_fields1 (select a2 i)))) 
  max1)))
(check-sat)
