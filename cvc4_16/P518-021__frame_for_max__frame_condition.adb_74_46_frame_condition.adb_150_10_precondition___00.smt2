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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

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
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

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

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__frame_condition__cell__value natural)(rec__frame_condition__cell__max_left natural)(rec__frame_condition__cell__max_right natural)))))
(define-fun us_split_fields_rec__frame_condition__cell__value__projection ((a us_split_fields)) natural 
  (rec__frame_condition__cell__value a))

(define-fun us_split_fields_rec__frame_condition__cell__max_left__projection ((a us_split_fields)) natural 
  (rec__frame_condition__cell__max_left a))

(define-fun us_split_fields_rec__frame_condition__cell__max_right__projection ((a us_split_fields)) natural 
  (rec__frame_condition__cell__max_right a))

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

(declare-datatypes ((cell__ref 0))
(((cell__refqtmk (cell__content us_rep)))))
(define-fun cell__ref_cell__content__projection ((a cell__ref)) us_rep 
  (cell__content a))

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

(declare-const a__first integer)

(declare-const a__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const first Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const last Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort t 0)

(declare-fun first1 (t) integer)

(declare-fun last1 (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range3 f)
     (=> (in_range3 l)
     (and (= (to_rep1 (first1 (mk f l))) f) (= (to_rep1 (last1 (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range3 low)
                   (and (in_range3 high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int us_rep))(rt t)))))
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

(declare-datatypes ((cell_array__ref 0))
(((cell_array__refqtmk (cell_array__content us_t)))))
(define-fun cell_array__ref_cell_array__content__projection ((a cell_array__ref)) us_t 
  (cell_array__content a))

(declare-fun get_max_right (Int (Array Int us_rep)) Int)

(declare-fun get_max_right__function_guard (Int Int (Array Int us_rep)) Bool)

;; get_max_right__post_axiom
  (assert
  (forall ((index Int))
  (forall ((frame_condition__update_max_2__a (Array Int us_rep)))
  (! (=>
     (and (dynamic_invariant1 index true true true true)
     (and (<= (to_rep1 a__first) index) (<= index (to_rep1 a__last))))
     (let ((result (get_max_right index frame_condition__update_max_2__a)))
     (=> (get_max_right__function_guard result index
     frame_condition__update_max_2__a) (dynamic_invariant result true false
     true true)))) :pattern ((get_max_right index
                             frame_condition__update_max_2__a)) ))))

;; get_max_right__def_axiom
  (assert
  (forall ((index Int))
  (forall ((frame_condition__update_max_2__a (Array Int us_rep)))
  (! (=> (dynamic_invariant1 index true true true true)
     (= (get_max_right index frame_condition__update_max_2__a) (to_rep
                                                               (rec__frame_condition__cell__max_right
                                                               (us_split_fields1
                                                               (select frame_condition__update_max_2__a index)))))) :pattern (
  (get_max_right index frame_condition__update_max_2__a)) ))))

(declare-fun frame_right (us_t (Array Int us_rep)) Bool)

(declare-fun frame_right__function_guard (Bool us_t (Array Int us_rep)) Bool)

(define-fun dynamic_invariant2 ((temp___expr_173 us_t)
  (temp___is_init_169 Bool) (temp___skip_constant_170 Bool)
  (temp___do_toplevel_171 Bool)
  (temp___do_typ_inv_172 Bool)) Bool (=>
                                     (not (= temp___skip_constant_170 true))
                                     (dynamic_property 1 2147483647
                                     (first2 temp___expr_173)
                                     (last2 temp___expr_173))))

;; frame_right__post_axiom
  (assert true)

;; frame_right__def_axiom
  (assert
  (forall ((old_a us_t))
  (forall ((frame_condition__update_max_2__a (Array Int us_rep)))
  (! (= (= (frame_right old_a frame_condition__update_max_2__a) true)
     (forall ((i Int))
     (=> (and (<= (to_rep1 a__first) i) (<= i (to_rep1 a__last)))
     (and
     (= (to_rep
        (rec__frame_condition__cell__value
        (us_split_fields1 (select frame_condition__update_max_2__a i)))) 
     (to_rep
     (rec__frame_condition__cell__value
     (us_split_fields1 (select (to_array old_a) i)))))
     (= (to_rep
        (rec__frame_condition__cell__max_left
        (us_split_fields1 (select frame_condition__update_max_2__a i)))) 
     (to_rep
     (rec__frame_condition__cell__max_left
     (us_split_fields1 (select (to_array old_a) i))))))))) :pattern (
  (frame_right old_a frame_condition__update_max_2__a)) ))))

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
                                    (in_range3 temp___expr_18)))

;; first__def_axiom
  (assert (= first (to_rep1 a__first)))

;; last__def_axiom
  (assert (= last (to_rep1 a__last)))

;; first__def_axiom
  (assert (= first3 last))

;; last__def_axiom
  (assert (= last3 first))

(assert
;; defqtvc
 ;; File "frame_condition.adb", line 150, characters 0-0
  (not
  (forall ((a (Array Int us_rep)) (temp___398 Int) (temp___399 Int) (k Int)
  (max Int) (a1 (Array Int us_rep)) (o Int) (o1 Int))
  (=> (dynamic_invariant1 first true false true true)
  (=> (= (to_rep1 a__first) temp___398)
  (=> (= temp___398 first)
  (=> (dynamic_invariant1 last true false true true)
  (=> (= (to_rep1 a__last) temp___399)
  (=> (= temp___399 last)
  (=> (dynamic_property 1 2147483647 (to_rep1 a__first) (to_rep1 a__last))
  (=> (dynamic_invariant1 first3 true false true true)
  (=> (= last first3)
  (=> (dynamic_invariant1 last3 true false true true)
  (=> (= first last3)
  (=> (< 0 (length (to_rep1 a__first) (to_rep1 a__last)))
  (=> (= k first3)
  (=> (dynamic_invariant1 k true false true true)
  (=> (= max 0)
  (=> (dynamic_invariant max true false true true)
  (=>
  (forall ((a2 (Array Int us_rep)) (j Int)) (get_max_right__function_guard
  (get_max_right j a2) j a2))
  (=>
  (forall ((a2 (Array Int us_rep)) (i Int)) (get_max_right__function_guard
  (get_max_right i a2) i a2))
  (=>
  (forall ((a2 (Array Int us_rep))
  (temp___loop_entry_378 (Array Int us_rep))) (frame_right__function_guard
  (frame_right
  (of_array temp___loop_entry_378 (to_rep1 a__first) (to_rep1 a__last)) a2)
  (of_array temp___loop_entry_378 (to_rep1 a__first) (to_rep1 a__last)) a2))
  (=>
  (forall ((a2 (Array Int us_rep)) (j Int)) (get_max_right__function_guard
  (get_max_right j a2) j a2))
  (=>
  (forall ((a2 (Array Int us_rep)) (i Int)) (get_max_right__function_guard
  (get_max_right i a2) i a2))
  (=>
  (forall ((a2 (Array Int us_rep))
  (temp___loop_entry_378 (Array Int us_rep))) (frame_right__function_guard
  (frame_right
  (of_array temp___loop_entry_378 (to_rep1 a__first) (to_rep1 a__last)) a2)
  (of_array temp___loop_entry_378 (to_rep1 a__first) (to_rep1 a__last)) a2))
  (=>
  (exists ((temp___loop_entry_378 (Array Int us_rep)))
  (and (= temp___loop_entry_378 a)
  (exists ((spark__branch Bool) (max1 Int))
  (and
  (and (and (<= (to_rep1 a__first) k) (<= k (to_rep1 a__last)))
  (exists ((o2 Int))
  (and
  (= (to_rep
     (rec__frame_condition__cell__value (us_split_fields1 (select a k)))) o2)
  (and (= spark__branch (ite (< max o2) true false))
  (ite (= spark__branch true)
  (and (and (<= (to_rep1 a__first) k) (<= k (to_rep1 a__last)))
  (exists ((o3 Int))
  (and
  (= (to_rep
     (rec__frame_condition__cell__value (us_split_fields1 (select a k)))) o3)
  (= max1 o3)))) (= max1 max))))))
  (exists ((c267b Int))
  (and (= c267b k)
  (and (dynamic_invariant1 c267b true false true true)
  (exists ((c268b Int))
  (and (= c268b max1)
  (and (dynamic_invariant c268b true false true true)
  (let ((q_ (us_split_fields1 (select a c267b))))
  (exists ((o2 natural))
  (and (= (to_rep o2) c268b)
  (and (and (<= (to_rep1 a__first) c267b) (<= c267b (to_rep1 a__last)))
  (exists ((a2 (Array Int us_rep)))
  (and
  (= a2 (store a c267b (us_repqtmk
                       (us_split_fieldsqtmk
                       (rec__frame_condition__cell__value q_)
                       (rec__frame_condition__cell__max_left q_) o2))))
  (exists ((o3 Int))
  (and (= (to_rep1 a__last) o3)
  (exists ((o4 Int))
  (and (= (to_rep1 a__first) o4)
  (exists ((k1 Int) (max2 Int) (c267b1 Int) (c268b1 Int))
  (and
  (and (and (<= (to_rep1 a__first) k1) (<= k1 (to_rep1 a__last)))
  (and
  (and
  (forall ((i Int))
  (=> (and (<= first3 i) (<= i k1))
  (<= (to_rep
      (rec__frame_condition__cell__value (us_split_fields1 (select a1 i)))) max2)))
  (forall ((i Int))
  (=> (and (<= k1 i) (<= i first3))
  (<= (to_rep
      (rec__frame_condition__cell__value (us_split_fields1 (select a1 i)))) max2))))
  (and
  (and
  (forall ((i Int))
  (=> (and (<= first3 i) (<= i k1))
  (forall ((j Int))
  (=> (and (<= i j) (<= j k1))
  (<= (to_rep
      (rec__frame_condition__cell__value (us_split_fields1 (select a1 i)))) 
  (get_max_right j a1))))))
  (forall ((i Int))
  (=> (and (<= k1 i) (<= i first3))
  (forall ((j Int))
  (=> (and (<= i j) (<= j first3))
  (<= (to_rep
      (rec__frame_condition__cell__value (us_split_fields1 (select a1 j)))) 
  (get_max_right i a1)))))))
  (= (frame_right
     (of_array temp___loop_entry_378 (to_rep1 a__first) (to_rep1 a__last))
     a1) true))))
  (and
  (and
  (and
  (and
  (and (dynamic_invariant1 c267b1 true true true true) (dynamic_invariant
  max2 true true true true)) (dynamic_invariant c268b1 true true true true))
  (forall ((temp___375 Int))
  (=>
  (and (<= (to_rep1 a__first) temp___375) (<= temp___375 (to_rep1 a__last)))
  (and
  (= (rec__frame_condition__cell__value
     (us_split_fields1 (select a1 temp___375))) (rec__frame_condition__cell__value
                                                (us_split_fields1
                                                (select a temp___375))))
  (= (rec__frame_condition__cell__max_left
     (us_split_fields1 (select a1 temp___375))) (rec__frame_condition__cell__max_left
                                                (us_split_fields1
                                                (select a temp___375))))))))
  (dynamic_invariant1 k1 true true true true)) (= k1 last3))))))))))))))))))))))))
  (=> (= (to_rep1 a__last) o)
  (=> (= (to_rep1 a__first) o1)
  (let ((o2 (of_array a o1 o)))
  (let ((o3 (frame_right o2 a1)))
  (=>
  (and (frame_right__function_guard o3 o2 a1)
  (= (= o3 true)
  (forall ((i Int))
  (=> (and (<= (to_rep1 a__first) i) (<= i (to_rep1 a__last)))
  (and
  (= (to_rep
     (rec__frame_condition__cell__value (us_split_fields1 (select a1 i)))) 
  (to_rep
  (rec__frame_condition__cell__value
  (us_split_fields1 (select (to_array o2) i)))))
  (= (to_rep
     (rec__frame_condition__cell__max_left (us_split_fields1 (select a1 i)))) 
  (to_rep
  (rec__frame_condition__cell__max_left
  (us_split_fields1 (select (to_array o2) i))))))))))
  (forall ((usf Int))
  (=>
  (= (and (ite (<= last3 usf) true false) (ite (<= usf first3) true false)) true)
  (forall ((usf1 Int))
  (=>
  (= (and (ite (<= usf usf1) true false) (ite (<= usf1 first3) true false)) true)
  (=> (in_range2 usf) (<= (to_rep1 a__first) usf)))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
