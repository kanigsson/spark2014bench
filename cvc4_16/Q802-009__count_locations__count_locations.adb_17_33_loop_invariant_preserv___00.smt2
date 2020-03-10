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

(define-fun to_rep ((x positive)) Int (positiveqtint x))

(declare-fun of_rep (Int) positive)

;; inversion_axiom
  (assert
  (forall ((x positive))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x positive)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int Bool))))))
(declare-fun slide ((Array Int Bool) Int Int) (Array Int Bool))

;; slide_eq
  (assert
  (forall ((a (Array Int Bool)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int Bool)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int Bool)) (a__first Int) (a__last Int)
  (b (Array Int Bool)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (ite (select a temp___idx_154) 1 0) (ite (select b (+ (- b__first a__first) temp___idx_154)) 1 0)))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int Bool)) (b (Array Int Bool)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (ite (select a temp___idx_154) 1 0) (ite (select b (+ (- b__first a__first) temp___idx_154)) 1 0)))))))))

(declare-fun partial_count_selected_locations ((Array Int Bool) Int) Int)

(declare-fun partial_count_selected_locations__function_guard (Int
  (Array Int Bool) Int) Bool)

(declare-sort sum_type 0)

(declare-fun sum_typeqtint (sum_type) Int)

;; sum_type'axiom
  (assert
  (forall ((i sum_type))
  (and (<= 0 (sum_typeqtint i)) (<= (sum_typeqtint i) 100))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (sum_type sum_type) Bool)

(declare-const dummy2 sum_type)

(declare-datatypes ((sum_type__ref 0))
(((sum_type__refqtmk (sum_type__content sum_type)))))
(define-fun sum_type__ref_sum_type__content__projection ((a sum_type__ref)) sum_type 
  (sum_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_163 Int)
  (temp___is_init_159 Bool) (temp___skip_constant_160 Bool)
  (temp___do_toplevel_161 Bool)
  (temp___do_typ_inv_162 Bool)) Bool (=>
                                     (or (= temp___is_init_159 true)
                                     (<= 0 100)) (in_range3 temp___expr_163)))

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 100))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (index_type index_type) Bool)

(declare-const dummy3 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun dynamic_invariant2 ((temp___expr_170 Int)
  (temp___is_init_166 Bool) (temp___skip_constant_167 Bool)
  (temp___do_toplevel_168 Bool)
  (temp___do_typ_inv_169 Bool)) Bool (=>
                                     (or (= temp___is_init_166 true)
                                     (<= 1 100)) (in_range4 temp___expr_170)))

;; partial_count_selected_locations__def_axiom
  (assert
  (forall ((sel (Array Int Bool)))
  (forall ((from Int))
  (! (=>
     (and (dynamic_invariant2 from true true true true)
     (partial_count_selected_locations__function_guard
     (partial_count_selected_locations sel from) sel from))
     (and
     (forall ((sel1 (Array Int Bool)) (from1 Int))
     (partial_count_selected_locations__function_guard
     (partial_count_selected_locations sel1 (+ from1 1)) sel1 (+ from1 1)))
     (= (partial_count_selected_locations sel from) (+ (ite (= (select sel from) true)
                                                       1 0) (ite (< from 100)
                                                            (partial_count_selected_locations
                                                            sel (+ from 1))
                                                            0))))) :pattern (
  (partial_count_selected_locations sel from)) ))))

(declare-fun count_selected_locations ((Array Int Bool)) Int)

(declare-fun count_selected_locations__function_guard (Int
  (Array Int Bool)) Bool)

;; count_selected_locations__post_axiom
  (assert
  (forall ((sel (Array Int Bool)))
  (! (let ((result (count_selected_locations sel)))
     (=> (count_selected_locations__function_guard result sel)
     (dynamic_invariant1 result true false true true))) :pattern ((count_selected_locations
                                                                  sel)) )))

;; count_selected_locations__def_axiom
  (assert
  (forall ((sel (Array Int Bool)))
  (! (and
     (forall ((sel1 (Array Int Bool)))
     (partial_count_selected_locations__function_guard
     (partial_count_selected_locations sel1 1) sel1 1))
     (= (count_selected_locations sel) (partial_count_selected_locations sel
                                       1))) :pattern ((count_selected_locations
                                                      sel)) )))

(declare-const sel (Array Int Bool))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int positive))))))
(declare-fun slide1 ((Array Int positive) Int Int) (Array Int positive))

;; slide_eq
  (assert
  (forall ((a (Array Int positive)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int positive)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int positive)) (a__first Int) (a__last Int)
  (b (Array Int positive)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (to_rep (select a temp___idx_155)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_155)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int positive)) (b (Array Int positive)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (to_rep (select a temp___idx_155)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_155)))))))))))

(declare-const max (Array Int positive))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_invariant3 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

;; partial_count_selected_locations__post_axiom
  (assert
  (forall ((sel1 (Array Int Bool)))
  (forall ((from Int))
  (! (=> (dynamic_invariant2 from true true true true)
     (let ((result (partial_count_selected_locations sel1 from)))
     (=> (partial_count_selected_locations__function_guard result sel1 from)
     (and (<= result (+ (- 100 from) 1)) (dynamic_invariant1 result true
     false true true))))) :pattern ((partial_count_selected_locations sel1
                                    from)) ))))

(assert
;; defqtvc
 ;; File "count_locations.ads", line 22, characters 0-0
  (not
  (forall ((st_count Int) (lowest_max Int) (st Int))
  (=> (= st_count 0)
  (=> (dynamic_invariant1 st_count true false true true)
  (=> (= lowest_max 2147483647)
  (=> (dynamic_invariant lowest_max true false true true)
  (=> (= st 1)
  (=> (= (and (ite (<= 1 st) true false) (ite (<= st 100) true false)) true)
  (let ((o sel))
  (let ((o1 (partial_count_selected_locations o st)))
  (=>
  (forall ((st1 Int) (o2 (Array Int Bool)))
  (partial_count_selected_locations__function_guard
  (partial_count_selected_locations o2 (+ st1 1)) o2 (+ st1 1)))
  (=>
  (and (partial_count_selected_locations__function_guard o1 o st)
  (and (dynamic_invariant1 o1 true false true true)
  (and
  (= o1 (+ (ite (= (select o st) true) 1 0) (ite (< st 100)
                                            (partial_count_selected_locations
                                            o (+ st 1)) 0)))
  (<= o1 (+ (- 100 st) 1)))))
  (let ((o2 sel))
  (let ((o3 (count_selected_locations o2)))
  (=>
  (forall ((o4 (Array Int Bool)))
  (partial_count_selected_locations__function_guard
  (partial_count_selected_locations o4 1) o4 1))
  (=>
  (and (count_selected_locations__function_guard o3 o2)
  (and (dynamic_invariant1 o3 true false true true)
  (= o3 (partial_count_selected_locations o2 1))))
  (forall ((st_count1 Int) (lowest_max1 Int) (st1 Int))
  (=> (count_selected_locations__function_guard
  (count_selected_locations sel) sel)
  (=>
  (forall ((st2 Int)) (partial_count_selected_locations__function_guard
  (partial_count_selected_locations sel st2) sel st2))
  (=>
  (and
  (= (count_selected_locations sel) (+ st_count1 (partial_count_selected_locations
                                                 sel st1)))
  (and
  (forall ((s Int))
  (=> (and (<= 1 s) (<= s (- st1 1)))
  (=> (= (select sel s) true) (<= lowest_max1 (to_rep (select max s))))))
  (and
  (or
  (and
  (forall ((s Int))
  (=> (and (<= 1 s) (<= s (- st1 1))) (not (= (select sel s) true))))
  (= lowest_max1 2147483647))
  (exists ((s Int))
  (and (and (<= 1 s) (<= s (- st1 1)))
  (and (= (select sel s) true) (= (to_rep (select max s)) lowest_max1)))))
  (< st_count1 st1))))
  (=>
  (= (and (ite (and
               (and (dynamic_invariant lowest_max1 true true true true)
               (in_range4 st1)) (dynamic_invariant1 st_count1 true true true
               true))
          true false) (ite (and (<= 1 st1) (<= st1 100)) true false)) true)
  (forall ((st_count2 Int) (lowest_max2 Int))
  (=>
  (exists ((spark__branch Bool))
  (and (= spark__branch (select sel st1))
  (ite (= spark__branch true)
  (let ((o4 (+ st_count1 1)))
  (and (in_range3 o4)
  (and (= st_count2 o4)
  (exists ((o5 Int))
  (and (= (to_rep (select max st1)) o5)
  (exists ((spark__branch1 Bool))
  (and (= spark__branch1 (ite (< o5 lowest_max1) true false))
  (ite (= spark__branch1 true)
  (exists ((o6 Int))
  (and (= (to_rep (select max st1)) o6) (= lowest_max2 o6)))
  (= lowest_max2 lowest_max1)))))))))
  (and (= st_count2 st_count1) (= lowest_max2 lowest_max1)))))
  (=> (not (= st1 100))
  (forall ((st2 Int))
  (=> (= st2 (+ st1 1))
  (let ((o4 sel))
  (let ((o5 (partial_count_selected_locations o4 st2)))
  (=>
  (forall ((st3 Int) (o6 (Array Int Bool)))
  (partial_count_selected_locations__function_guard
  (partial_count_selected_locations o6 (+ st3 1)) o6 (+ st3 1)))
  (=>
  (and (partial_count_selected_locations__function_guard o5 o4 st2)
  (and (dynamic_invariant1 o5 true false true true)
  (and
  (= o5 (+ (ite (= (select o4 st2) true) 1 0) (ite (< st2 100)
                                              (partial_count_selected_locations
                                              o4 (+ st2 1)) 0)))
  (<= o5 (+ (- 100 st2) 1)))))
  (let ((o6 sel))
  (let ((o7 (count_selected_locations o6)))
  (=>
  (forall ((o8 (Array Int Bool)))
  (partial_count_selected_locations__function_guard
  (partial_count_selected_locations o8 1) o8 1))
  (=>
  (and (count_selected_locations__function_guard o7 o6)
  (and (dynamic_invariant1 o7 true false true true)
  (= o7 (partial_count_selected_locations o6 1))))
  (=> (count_selected_locations__function_guard
  (count_selected_locations sel) sel)
  (=>
  (forall ((st3 Int)) (partial_count_selected_locations__function_guard
  (partial_count_selected_locations sel st3) sel st3))
  (=>
  (= (count_selected_locations sel) (+ st_count2 (partial_count_selected_locations
                                                 sel st2)))
  (=>
  (forall ((s Int))
  (=> (and (<= 1 s) (<= s (- st2 1)))
  (=> (= (select sel s) true) (<= lowest_max2 (to_rep (select max s))))))
  (or
  (and
  (forall ((s Int))
  (=> (and (<= 1 s) (<= s (- st2 1))) (not (= (select sel s) true))))
  (= lowest_max2 2147483647))
  (exists ((s Int))
  (and (and (<= 1 s) (<= s (- st2 1)))
  (and (= (select sel s) true) (= (to_rep (select max s)) lowest_max2))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
