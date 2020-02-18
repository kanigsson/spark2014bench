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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort element 0)

(declare-fun elementqtint (element) Int)

;; element'axiom
  (assert
  (forall ((i element))
  (and (<= (- 2147483648) (elementqtint i)) (<= (elementqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (element element) Bool)

(declare-const dummy element)

(declare-datatypes ((element__ref 0))
(((element__refqtmk (element__content element)))))
(define-fun element__ref_element__content__projection ((a element__ref)) element 
  (element__content a))

(define-fun to_rep ((x element)) Int (elementqtint x))

(declare-fun of_rep (Int) element)

;; inversion_axiom
  (assert
  (forall ((x element)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x element)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int element))))))
(declare-fun slide ((Array Int element) Int Int) (Array Int element))

;; slide_eq
  (assert
  (forall ((a (Array Int element)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int element)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int element)) (a__first Int) (a__last Int)
  (b (Array Int element)) (b__first Int)
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
  (forall ((a (Array Int element)) (b (Array Int element)))
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

(declare-fun value_found_in_range ((Array Int element) Int Int Int) Bool)

(declare-fun value_found_in_range__function_guard (Bool (Array Int element)
  Int Int Int) Bool)

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 1 (indexqtint i)) (<= (indexqtint i) 10))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (index index) Bool)

(declare-const dummy1 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun dynamic_invariant ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= 1 10)) (in_range2 temp___expr_161)))

(define-fun dynamic_invariant1 ((temp___expr_168 Int)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (or (= temp___is_init_164 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range1 temp___expr_168)))

;; value_found_in_range__post_axiom
  (assert true)

;; value_found_in_range__def_axiom
  (assert
  (forall ((a (Array Int element)))
  (forall ((val__ Int) (low Int) (up Int))
  (! (= (= (value_found_in_range a val__ low up) true)
     (exists ((j Int))
     (and (and (<= low j) (<= j up)) (= (to_rep (select a j)) val__)))) :pattern (
  (value_found_in_range a val__ low up)) ))))

(declare-const a (Array Int element))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const val__ Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun to_rep1 ((x index)) Int (indexqtint x))

(declare-fun of_rep1 (Int) index)

;; inversion_axiom
  (assert
  (forall ((x index))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x index)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__linear_search__search_result__found Bool)))))
(define-fun us_split_discrs_rec__linear_search__search_result__found__projection ((a1 us_split_discrs)) Bool 
  (rec__linear_search__search_result__found a1))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a1 us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a1))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__linear_search__search_result__at_index index)))))
(define-fun us_split_fields_rec__linear_search__search_result__at_index__projection ((a1 us_split_fields)) index 
  (rec__linear_search__search_result__at_index a1))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a1 us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a1))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a1 us_rep)) us_split_discrs 
  (us_split_discrs1 a1))

(define-fun us_rep___split_fields__projection ((a1 us_rep)) us_split_fields 
  (us_split_fields1 a1))

(define-fun linear_search__search_result__at_index__pred ((a1 us_rep)) Bool (= (ite 
  (rec__linear_search__search_result__found (us_split_discrs1 a1)) 1 0) 1))

(define-fun bool_eq1 ((a1 us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__linear_search__search_result__found
                                (us_split_discrs1 a1)) 1 0) (ite (rec__linear_search__search_result__found
                                                                 (us_split_discrs1
                                                                 b)) 1 0))
                        (=> (linear_search__search_result__at_index__pred a1)
                        (= (to_rep1
                           (rec__linear_search__search_result__at_index
                           (us_split_fields1 a1))) (to_rep1
                                                   (rec__linear_search__search_result__at_index
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

(declare-const linear_search__search_result__found__first__bit Int)

(declare-const linear_search__search_result__found__last__bit Int)

(declare-const linear_search__search_result__found__position Int)

;; linear_search__search_result__found__first__bit_axiom
  (assert (<= 0 linear_search__search_result__found__first__bit))

;; linear_search__search_result__found__last__bit_axiom
  (assert
  (< linear_search__search_result__found__first__bit linear_search__search_result__found__last__bit))

;; linear_search__search_result__found__position_axiom
  (assert (<= 0 linear_search__search_result__found__position))

(declare-const linear_search__search_result__at_index__first__bit Int)

(declare-const linear_search__search_result__at_index__last__bit Int)

(declare-const linear_search__search_result__at_index__position Int)

;; linear_search__search_result__at_index__first__bit_axiom
  (assert (<= 0 linear_search__search_result__at_index__first__bit))

;; linear_search__search_result__at_index__last__bit_axiom
  (assert
  (< linear_search__search_result__at_index__first__bit linear_search__search_result__at_index__last__bit))

;; linear_search__search_result__at_index__position_axiom
  (assert (<= 0 linear_search__search_result__at_index__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((search_result__ref 0))
(((search_result__refqtmk (search_result__content us_rep)))))
(define-fun search_result__ref_search_result__content__projection ((a1 search_result__ref)) us_rep 
  (search_result__content a1))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const res__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun default_initial_assumption ((temp___expr_187 us_rep)
  (temp___skip_top_level_188 Bool)) Bool (= (rec__linear_search__search_result__found
                                            (us_split_discrs1
                                            temp___expr_187)) (distinct 0 0)))

(declare-sort tindexB 0)

(declare-fun tindexBqtint (tindexB) Int)

;; tindexB'axiom
  (assert
  (forall ((i tindexB))
  (and (<= (- 128) (tindexBqtint i)) (<= (tindexBqtint i) 127))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 128) x) (<= x 127)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (tindexB tindexB) Bool)

(declare-const dummy3 tindexB)

(declare-datatypes ((tindexB__ref 0))
(((tindexB__refqtmk (tindexB__content tindexB)))))
(define-fun tindexB__ref_tindexB__content__projection ((a1 tindexB__ref)) tindexB 
  (tindexB__content a1))

(define-fun in_range4 ((rec__linear_search__search_result__found1 Bool)
  (a1 us_rep)) Bool (= rec__linear_search__search_result__found1 (rec__linear_search__search_result__found
                                                                 (us_split_discrs1
                                                                 a1))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const linear_search__search_result__found__first__bit1 Int)

(declare-const linear_search__search_result__found__last__bit1 Int)

(declare-const linear_search__search_result__found__position1 Int)

;; linear_search__search_result__found__first__bit_axiom
  (assert (<= 0 linear_search__search_result__found__first__bit1))

;; linear_search__search_result__found__last__bit_axiom
  (assert
  (< linear_search__search_result__found__first__bit1 linear_search__search_result__found__last__bit1))

;; linear_search__search_result__found__position_axiom
  (assert (<= 0 linear_search__search_result__found__position1))

(declare-const linear_search__search_result__at_index__first__bit1 Int)

(declare-const linear_search__search_result__at_index__last__bit1 Int)

(declare-const linear_search__search_result__at_index__position1 Int)

;; linear_search__search_result__at_index__first__bit_axiom
  (assert (<= 0 linear_search__search_result__at_index__first__bit1))

;; linear_search__search_result__at_index__last__bit_axiom
  (assert
  (< linear_search__search_result__at_index__first__bit1 linear_search__search_result__at_index__last__bit1))

;; linear_search__search_result__at_index__position_axiom
  (assert (<= 0 linear_search__search_result__at_index__position1))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((t1b__ref 0))
(((t1b__refqtmk (t1b__content us_rep)))))
(define-fun t1b__ref_t1b__content__projection ((a1 t1b__ref)) us_rep 
  (t1b__content a1))

(define-fun in_range5 ((rec__linear_search__search_result__found1 Bool)
  (a1 us_rep)) Bool (= rec__linear_search__search_result__found1 (rec__linear_search__search_result__found
                                                                 (us_split_discrs1
                                                                 a1))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const linear_search__search_result__found__first__bit2 Int)

(declare-const linear_search__search_result__found__last__bit2 Int)

(declare-const linear_search__search_result__found__position2 Int)

;; linear_search__search_result__found__first__bit_axiom
  (assert (<= 0 linear_search__search_result__found__first__bit2))

;; linear_search__search_result__found__last__bit_axiom
  (assert
  (< linear_search__search_result__found__first__bit2 linear_search__search_result__found__last__bit2))

;; linear_search__search_result__found__position_axiom
  (assert (<= 0 linear_search__search_result__found__position2))

(declare-const linear_search__search_result__at_index__first__bit2 Int)

(declare-const linear_search__search_result__at_index__last__bit2 Int)

(declare-const linear_search__search_result__at_index__position2 Int)

;; linear_search__search_result__at_index__first__bit_axiom
  (assert (<= 0 linear_search__search_result__at_index__first__bit2))

;; linear_search__search_result__at_index__last__bit_axiom
  (assert
  (< linear_search__search_result__at_index__first__bit2 linear_search__search_result__at_index__last__bit2))

;; linear_search__search_result__at_index__position_axiom
  (assert (<= 0 linear_search__search_result__at_index__position2))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((t3b__ref 0))
(((t3b__refqtmk (t3b__content us_rep)))))
(define-fun t3b__ref_t3b__content__projection ((a1 t3b__ref)) us_rep 
  (t3b__content a1))

(assert
;; defqtvc
 ;; File "linear_search.ads", line 33, characters 0-0
  (not
  (forall ((res__split_fields index) (res__split_discrs Bool))
  (=> (dynamic_invariant1 val__ true false true true)
  (=> (<= 0 val__)
  (=> (value_found_in_range__function_guard
  (value_found_in_range a val__ 2 10) a val__ 2 10)
  (forall ((linear_search__search__result us_rep))
  (=>
  (forall ((pos Int)) (value_found_in_range__function_guard
  (value_found_in_range a val__ 1 pos) a val__ 1 pos))
  (=>
  (forall ((pos Int)) (value_found_in_range__function_guard
  (value_found_in_range a val__ 1 pos) a val__ 1 pos))
  (=>
  (forall ((pos Int)) (value_found_in_range__function_guard
  (value_found_in_range a val__ 1 pos) a val__ 1 pos))
  (=>
  (exists ((pos Int))
  (and (= pos 1)
  (and (in_range3 pos)
  (and (= res__attr__constrained false)
  (and (default_initial_assumption
  (us_repqtmk (us_split_discrsqtmk res__split_discrs)
  (us_split_fieldsqtmk res__split_fields)) false)
  (or
  (and (<= pos 10)
  (exists ((pos1 Int))
  (and
  (and (and (<= 1 pos) (<= pos 10))
  (exists ((o Int))
  (and (= (to_rep (select a pos)) o)
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (= o val__) true false))
  (ite (= spark__branch true) (= pos1 pos)
  (and
  (or
  (not
  (= (and (ite (<= 1 pos) true false) (ite (<= pos 10) true false)) true))
  (and (in_range2 pos)
  (let ((o1 val__))
  (let ((o2 a))
  (let ((o3 (value_found_in_range o2 o1 1 pos)))
  (and (value_found_in_range__function_guard o3 o2 o1 1 pos)
  (= (= o3 true)
  (exists ((j Int))
  (and (and (<= 1 j) (<= j pos)) (= (to_rep (select o2 j)) o1))))))))))
  (exists ((pos2 Int))
  (and
  (and (and (<= 1 pos2) (<= pos2 10))
  (not (= (value_found_in_range a val__ 1 pos2) true)))
  (and (in_range3 pos2)
  (exists ((temp___216 Int))
  (and (= temp___216 pos2)
  (let ((o1 (+ pos2 1)))
  (and (in_range3 o1)
  (and (= pos1 o1)
  (and (<= pos1 10)
  (and (and (<= 1 pos1) (<= pos1 10))
  (exists ((o2 Int))
  (and (= (to_rep (select a pos1)) o2)
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (= o2 val__) true false))
  (= spark__branch1 true))))))))))))))))))))))
  (and (in_range2 pos1)
  (exists ((o index))
  (and (= (to_rep1 o) pos1)
  (and
  (=> (= res__attr__constrained true) (= (distinct 1 0) res__split_discrs))
  (exists ((res__split_fields1 index))
  (and (= res__split_fields1 o)
  (exists ((res__split_discrs1 Bool))
  (and (= res__split_discrs1 (distinct 1 0))
  (= linear_search__search__result (us_repqtmk
                                   (us_split_discrsqtmk res__split_discrs1)
                                   (us_split_fieldsqtmk res__split_fields1))))))))))))))
  (and
  (or (not (<= pos 10))
  (and (and (<= 1 pos) (<= pos 10))
  (exists ((o Int))
  (and (= (to_rep (select a pos)) o)
  (exists ((spark__branch Bool))
  (and (= spark__branch (ite (= o val__) true false))
  (and (not (= spark__branch true))
  (and
  (or
  (not
  (= (and (ite (<= 1 pos) true false) (ite (<= pos 10) true false)) true))
  (and (in_range2 pos)
  (let ((o1 val__))
  (let ((o2 a))
  (let ((o3 (value_found_in_range o2 o1 1 pos)))
  (and (value_found_in_range__function_guard o3 o2 o1 1 pos)
  (= (= o3 true)
  (exists ((j Int))
  (and (and (<= 1 j) (<= j pos)) (= (to_rep (select o2 j)) o1))))))))))
  (exists ((pos1 Int))
  (and
  (and (and (<= 1 pos1) (<= pos1 10))
  (not (= (value_found_in_range a val__ 1 pos1) true)))
  (and (in_range3 pos1)
  (exists ((temp___216 Int))
  (and (= temp___216 pos1)
  (let ((o1 (+ pos1 1)))
  (and (in_range3 o1)
  (exists ((pos2 Int)) (and (= pos2 o1) (not (<= pos2 10)))))))))))))))))))
  (and
  (=> (= res__attr__constrained true) (= (distinct 0 0) res__split_discrs))
  (exists ((res__split_fields1 index))
  (and (= res__split_fields1 dummy1)
  (exists ((res__split_discrs1 Bool))
  (and (= res__split_discrs1 (distinct 0 0))
  (= linear_search__search__result (us_repqtmk
                                   (us_split_discrsqtmk res__split_discrs1)
                                   (us_split_fieldsqtmk res__split_fields1)))))))))))))))
  (=>
  (=> (= (= (to_rep (select a 1)) val__) true)
  (= (to_rep1
     (rec__linear_search__search_result__at_index
     (us_split_fields1 linear_search__search__result))) 1))
  (=>
  (=>
  (= (and (not (= (to_rep (select a 1)) val__)) (value_found_in_range 
                                                a val__ 2 10)) true)
  (= (rec__linear_search__search_result__found
     (us_split_discrs1 linear_search__search__result)) true))
  (=>
  (=>
  (forall ((j Int))
  (=> (and (<= 1 j) (<= j 10)) (not (= (to_rep (select a j)) val__))))
  (not
  (= (rec__linear_search__search_result__found
     (us_split_discrs1 linear_search__search__result)) true)))
  (=>
  (= (rec__linear_search__search_result__found
     (us_split_discrs1 linear_search__search__result)) true)
  (= (to_rep
     (select a (to_rep1
               (rec__linear_search__search_result__at_index
               (us_split_fields1 linear_search__search__result))))) val__))))))))))))))))
(check-sat)